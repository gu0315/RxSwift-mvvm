//
//  AttentionViewModel.swift
//  Keep
//
//  Created by 顾钱想 on 2020/9/12.
//  Copyright © 2020 顾钱想. All rights reserved.
//

import Foundation
import RxDataSources
import RxMJ
final class AttentionViewModel: RefreshViewModel {
    // 记录当前的索引值
    var index: Int = 1
    var lastId = ""
    var position: Int = 0
    struct Input{
    }
    struct Output {
        let items: Driver<[HomeAttentionSection]>
    }
}
extension AttentionViewModel: ViewModelable {

    func transform(input: AttentionViewModel.Input) -> AttentionViewModel.Output {
        let elements = BehaviorRelay<[HomeAttentionSection]>(value: [])
        let output = Output(items: elements.asDriver())

        var page: Int = 1
        //下拉刷新
        let loadNew = refreshOutput.headerRefreshing.then(page = 1)
        .flatMapLatest { [unowned self] _ in
            self.request()
        }
        //上拉加载更多
        let loadMore = refreshOutput.footerRefreshing.then(page += 1)
        .flatMapLatest{[unowned self] _ in
            self.request(lastId: self.lastId)
        }
        // 数据源
        loadNew.drive(onNext: { [weak self] obj in
            guard self != nil else { return }
            let value = obj.data?.items ?? []
            self?.lastId = ""
            self?.position = 0
            elements.accept([HomeAttentionSection.init(items: value)])
        }).disposed(by: disposeBag)

        loadMore.drive(onNext: { [weak self] obj in
            guard self != nil else { return }
            let value = (elements.value.first?.items ?? []) + (obj.data?.items ?? [])
            self?.lastId = obj.data?.lastId ?? ""
            self?.position = value.count
            elements.accept([HomeAttentionSection.init(items: value)])
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
extension AttentionViewModel {
    func request(lastId: String = "",firstId: String = "") -> Driver<HomeAttentionRootClass> {
        homeProvider.rx.request(.attention(position: position, lastId: lastId, firstId: firstId))
        .mapObject(HomeAttentionRootClass.self)
        .debug()
        .trackActivity(loading)
        .trackError(refreshError)
        .trackError(error)
        .asDriverOnErrorJustComplete()
    }
}

