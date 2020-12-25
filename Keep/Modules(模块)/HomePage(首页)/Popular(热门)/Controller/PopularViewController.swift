//
//  PopularViewController.swift
//  Keep
//
//  Created by 顾钱想 on 2020/9/5.
//  Copyright © 2020 顾钱想. All rights reserved.
//

import UIKit
import SwiftyJSON
import MJRefresh
import RxDataSources
class PopularViewController: CollectionViewController<PopularViewModel> {

    var dataSource:RxCollectionViewSectionedReloadDataSource<HomePopularSection>!

    override func viewDidLoad() {
       super.viewDidLoad()
    }
    override func makeUI() {
        super.makeUI()
        let layout = WaterfallMutiSectionFlowLayout()
        layout.delegate = self
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.init(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1)
        collectionView.register(PopularCollectionViewCell.self, forCellWithReuseIdentifier: "PopularCollectionViewCell")
        view.addSubview(collectionView)
        collectionView.refreshHeader = RefreshHeader()
        collectionView.refreshFooter = RefreshFooter()
        collectionView.refreshHeader?.beginRefreshing()
    }
    override func viewDidAppear(_ animated: Bool) {
        bindError()
        //bindLoadingToIndicatorToWindow()
    }
    override func bindViewModel() {
        super.bindViewModel()
        let input = PopularViewModel.Input()
        let output = viewModel.transform(input: input)
        //创建数据源
        dataSource = RxCollectionViewSectionedReloadDataSource
           <HomePopularSection>(
           configureCell: { (dataSource, collectionView, indexPath, element) in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCollectionViewCell",for: indexPath) as! PopularCollectionViewCell
            cell.item = element
            return cell
           }
        )
        //绑定单元格数据
        output.items.drive(collectionView.rx.items(dataSource: dataSource)).disposed(by: rx.disposeBag)
        //设置代理
        collectionView.rx.setDelegate(self).disposed(by: rx.disposeBag)
    }
}

extension PopularViewController: WaterfallMutiSectionDelegate {
    //设置单元格尺寸
    func heightForRowAtIndexPath(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, indexPath: IndexPath, itemWidth: CGFloat) -> CGFloat {
        return  dataSource?[indexPath].entry?.itemHeight ?? 200.0
    }
    func insetForSection(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> UIEdgeInsets {
       return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    func lineSpacing(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGFloat {
      return 5
    }
    func interitemSpacing(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGFloat {
      return 5
    }
    func spacingWithLastSection(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGFloat {
      return 15
    }
}

extension PopularViewController: UIScrollViewDelegate {

}



