//
//  PopularCollectionView.swift
//  Keep
//  瀑布流滑动优化
//  Created by 顾钱想 on 2020/12/23.
//  Copyright © 2020 顾钱想. All rights reserved.
//

import UIKit

class PopularCollectionView: UICollectionView,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var data:[HomePopularEntry]?
    ///初始化
    init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout ,data:[HomePopularEntry]?) {
        self.data = data
        super.init(frame: frame, collectionViewLayout: layout)
    }

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCollectionViewCell", for: indexPath)


        return cell
    }

}
extension PopularCollectionView: WaterfallMutiSectionDelegate {
    //设置单元格尺寸
    func heightForRowAtIndexPath(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, indexPath: IndexPath, itemWidth: CGFloat) -> CGFloat {
        return  data?[indexPath.row].itemHeight ?? 200
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
