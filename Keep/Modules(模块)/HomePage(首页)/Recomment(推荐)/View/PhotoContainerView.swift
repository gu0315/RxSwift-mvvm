//
//  PhotoContainerView.swift
//  Keep
//
//  Created by 顾钱想 on 2020/9/8.
//  Copyright © 2020 顾钱想. All rights reserved.
//

import UIKit
import JXPhotoBrowser
import YYWebImage
let margin: CGFloat = 8
class PhotoContainerView: UIView {

    var picPathStringsArray = [String]()
    var imageViewsArray = [UIImageView]()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.makeUI()
    }

    func makeUI() {
        self.backgroundColor = .white
        var temp = [UIImageView]()
        
        for i in 0...8 {
            let imageView = UIImageView()
            self.addSubview(imageView)
            imageView.isUserInteractionEnabled = true
            imageView.tag = i
            let gesture = UITapGestureRecognizer.init(target: self, action: #selector(tapImageView(_:)))
            imageView.addGestureRecognizer(gesture)
            temp.append(imageView)
        }
        imageViewsArray = temp
    }


    func setImageUrl(picPathArr: Array<String>) {
        picPathStringsArray = picPathArr
        _ = imageViewsArray.filter { $0.tag >= picPathArr.count }.map {
            $0.isHidden = true
        }
        if picPathArr.count == 0 {
            self.height = 0
            return
        }
        let itemW = self.itemWidthitemWidthForPicPathArray(picPathArr: picPathStringsArray)
        var itemH: CGFloat = 0.0
        if picPathArr.count == 1 {
           let size = Event.share.imageSise(str: picPathArr.first ?? "")
           if (size.width > 0.0) {
             itemH = (size.height) / (size.width) * CGFloat(itemW);
           } else {
             itemH = itemW
           }
        } else {
           itemH = itemW
        }
        let perRowItemCount = self.perRowItemCountForPicPathArray(picPathArr: picPathStringsArray)

        for i in 0...picPathStringsArray.count-1 {
            let columnIndex = i % perRowItemCount
            let rowIndex = i / perRowItemCount
            let imageView = imageViewsArray[i]
            imageView.isHidden = false;
            imageView.layer.yy_setImage(with: URL(string: picPathStringsArray[i]), placeholder: nil, options: [], manager: nil, progress: nil, transform: nil, completion: nil)
            imageView.frame = CGRect.init(x: CGFloat(columnIndex) * (itemW + margin) + KHomeContentInset, y: CGFloat(rowIndex) * (itemH + margin), width: itemW, height: itemH)
        }

    }

    func itemWidthitemWidthForPicPathArray(picPathArr: Array<String>) -> CGFloat {
        if picPathArr.count == 1 {
            return 200
        } else if KIsIpad {
            return 160
        } else {
            return (DEVICE_WIDTH - KHomeContentInset * 2 - margin * 2) / 3
        }
    }

    func perRowItemCountForPicPathArray(picPathArr: Array<String>) -> NSInteger {
        if picPathArr.count <= 3 {
           return picPathArr.count
        } else if picPathArr.count <= 4 {
           return 2
        } else {
           return 3
        }
    }

    @objc func tapImageView(_ tap: UITapGestureRecognizer) {
        let imageView = tap.view
        let browser = JXPhotoBrowser()
        browser.numberOfItems = {
            self.picPathStringsArray.count
        }
        browser.reloadCellAtIndex = { context in
            let url = URL.init(string: self.picPathStringsArray[context.index])
            let browserCell = context.cell as? JXPhotoBrowserImageCell
            browserCell?.index = context.index
            browserCell?.imageView.sd_setImage(with: url, completed: { (_, _, _, _) in
                browserCell?.setNeedsLayout()
            })
        }
        // 数字样式的页码指示器
        browser.pageIndicator = JXPhotoBrowserNumberPageIndicator()
        browser.pageIndex = imageView?.tag ?? 0
        browser.show()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
