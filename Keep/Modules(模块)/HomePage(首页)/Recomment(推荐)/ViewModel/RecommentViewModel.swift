//
//  RecommentViewModel.swift
//  Keep
//
//  Created by 顾钱想 on 2020/9/8.
//  Copyright © 2020 顾钱想. All rights reserved.
//

import RxDataSources
import RxMJ
class RecommentViewModel: RefreshViewModel {
    var sessionId = ""
    var lastId = ""
    
    struct Input{
    }
    struct Output {
        /// 数据源
        let items: Driver<[RecommentSection]>

    }
}

extension RecommentViewModel: ViewModelable {

    func transform(input: RecommentViewModel.Input) -> RecommentViewModel.Output {
        let elements = BehaviorRelay<[RecommentSection]>(value: [])
        let output = Output(items: elements.asDriver())

        var page: Int = 1
        //下拉刷新
        let loadNew = refreshOutput.headerRefreshing.then(page = 1)
        .flatMapLatest { [unowned self] _ in
            self.request(sessionId: self.sessionId, lastId: self.lastId)
        }
        //上拉加载更多
        let loadMore = refreshOutput.footerRefreshing.then(page += 1)
        .flatMapLatest{[unowned self] _ in
            self.request(sessionId: self.sessionId, lastId: self.lastId)
        }
        // 数据源
        loadNew.drive(onNext: { [weak self] obj in
            guard self != nil else { return }
            let value = obj.data?.items?.filter {
                $0.recommendEntry != nil
            }
            self?.lastId = ""
            self?.sessionId = ""
            elements.accept([RecommentSection.init(items: value ?? [])])
        }).disposed(by: disposeBag)
        
        loadMore.drive(onNext: { [weak self] obj in
            guard self != nil else { return }
            let newValue = obj.data?.items?.filter {
                $0.recommendEntry != nil
            }
            let value = (elements.value.first?.items ?? []) + (newValue ?? [])
            self?.lastId = obj.data?.lastId ?? ""
            self?.sessionId = obj.data?.sessionId ?? ""
            elements.accept([RecommentSection.init(items: value)])
        }).disposed(by: disposeBag)

        // success 下的刷新状态
        loadNew
        .mapTo(false)
        .drive(refreshInput.headerRefreshState)
        .disposed(by: disposeBag)

        ///通过使用 merge 操作符你可以将多个 Observables 合并成一个
        ///这里自己抓包的数据,根据自己业务处理,处理page == pageCount
        Driver.merge(
        loadNew.map {
          var state: RxMJRefreshFooterState = .default
          if page == 1 && $0.data?.items?.isEmpty ?? false {
              state = .hidden
          } else if $0.data?.items?.isEmpty ?? false {
              state = .noMoreData
          } else {
              state = .default
          }
          return state
       },

       loadMore.map {
         return $0.data?.items?.isEmpty ?? false ? RxMJRefreshFooterState .noMoreData: RxMJRefreshFooterState.default
       })
       .startWith(.hidden)
       .drive(refreshInput.footerRefreshState)
       .disposed(by: disposeBag)
       return output
    }
}
extension RecommentViewModel {
    func request(sessionId: String,lastId: String) -> Driver<HomeRecommentRootClass> {
        homeProvider.rx.request(.recomment(sessionId: sessionId, lastId: lastId))
        .observeOn(ConcurrentDispatchQueueScheduler(qos: DispatchQoS.default))
        .mapObject(HomeRecommentRootClass.self)
        .debug()
        .trackActivity(loading)
        .trackError(refreshError)
        .trackError(error)
        .subscribeOn(MainScheduler.asyncInstance)
        .asDriverOnErrorJustComplete()
    }
}


