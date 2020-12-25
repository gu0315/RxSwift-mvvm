//
//  RecommentViewController.swift
//  Keep
//
//  Created by 顾钱想 on 2020/9/4.
//  Copyright © 2020 顾钱想. All rights reserved.
//

import UIKit
import JXCategoryView
import SwiftyJSON
import MJRefresh
import RxDataSources

class RecommentViewController: TableViewController<RecommentViewModel> {
    var dataSource:RxTableViewSectionedReloadDataSource<RecommentSection>!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        bindError()
        //bindLoadingToIndicatorToWindow()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    override func makeUI() {
        super .makeUI()
        //创建一个重用的单元格
        tableView.register(WaterfallTableViewCell.self, forCellReuseIdentifier: "WaterfallTableViewCell")
        tableView.estimatedRowHeight = 0
        tableView.separatorStyle = .none
        tableView.refreshHeader = RefreshHeader()
        tableView.refreshFooter = RefreshFooter()
        tableView.refreshHeader?.beginRefreshing()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        let input = RecommentViewModel.Input()
        let output = viewModel.transform(input: input)
        //创建数据源
        dataSource = RxTableViewSectionedReloadDataSource
          <RecommentSection>(configureCell: {
            [weak self] (dataSource, tv, indexPath, element)  in
            let cell: WaterfallTableViewCell = self?.tableView.dequeueReusableCell(withIdentifier: "WaterfallTableViewCell", for: indexPath) as! WaterfallTableViewCell
            //print("cell复用")
            cell.selectionStyle = .none
            cell.item = element
            //cell中按钮点击事件订阅
            cell.moreBtn.rx.tap.asDriver()
                .drive(onNext: { _ in
                //print("TODO待完善 模仿微信,是否滑动到顶部,防止跳跃观看")
                element.recommendEntry?.isClickMore =  !(element.recommendEntry?.isClickMore ?? false)
                // MARK: - TODO待完善 模仿微信,是否滑动到顶部,防止跳跃观看
                var isScrollToRow: Bool = false  ///是否需要滑动
                let arr = self?.tableView.indexPathsForVisibleRows?.compactMap({ (obj) -> Int? in
                    obj.row
                }).filter {
                    $0 < indexPath.row
                }
                if (arr?.count == 0) {
                    isScrollToRow = true
                }
                tv.reloadRows(at: [indexPath], with: .none)
                if (isScrollToRow) {
                    tv.scrollToRow(at: indexPath, at: .top, animated: false)
                }
            }).disposed(by: cell.disposeBag)

            ///点赞
            cell.footView.likeBtn.rx.tap.asDriver().drive(onNext: { _ in
                element.recommendEntry?.hasLiked = !(element.recommendEntry?.hasLiked ?? false)
                cell.footView.likeBtn.isSelected = element.recommendEntry?.hasLiked ?? false

                print("===============")
                if cell.footView.likeBtn.isSelected {
                    element.recommendEntry?.likes! += 1
                    cell.footView.likeBtn.setTitle("\(element.recommendEntry?.likes ?? 0)", for: .selected)
                } else {
                    element.recommendEntry?.likes! -= 1
                    cell.footView.likeBtn.setTitle("\(element.recommendEntry?.likes ?? 0)", for: .normal)
                }
            }).disposed(by: cell.disposeBag)
            return cell
        })
        //绑定单元格数据
        output.items.drive(tableView.rx.items(dataSource: dataSource)).disposed(by: rx.disposeBag)
        //设置代理
        tableView.rx.setDelegate(self).disposed(by: rx.disposeBag)
    }

    deinit {

    }

}

extension RecommentViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let _ = dataSource?[indexPath],let _ = dataSource?[indexPath.section] else {
            return 0.0
        }
        return dataSource?[indexPath].recommendEntry?.itemHeight ?? 90
    }
}




