//
//  PopularCollectionViewCell.swift
//  GkIos
//
//  Created by 顾钱想 on 2020/8/28.
//  Copyright © 2020 顾钱想. All rights reserved.
//
import UIKit
import SDWebImage
class PopularCollectionViewCell: UICollectionViewCell {
    var palyBtn: UIButton!
    var titleLab: UILabel!
    var img:UIImageView!
    var bgView: CALayer!
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.cornerRadius = 3
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.makeUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func makeUI() {
        bgView = CALayer.init()
        bgView.frame = CGRect.init(x: 0, y: 0, width: (DEVICE_WIDTH - 25) / 2, height: self.height)

        self.contentView.layer.addSublayer(bgView)

        img = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: (DEVICE_WIDTH - 25) / 2, height: self.height - 30))
        bgView.addSublayer(img.layer)

        titleLab = UILabel.init(frame: CGRect.init(x: 0, y:self.height - 30, width: (DEVICE_WIDTH - 25) / 2, height: 30))
        bgView.addSublayer(titleLab.layer)

        palyBtn = UIButton(frame: CGRect.init(x: (DEVICE_WIDTH - 25) / 2 - 80, y: 30, width: 40, height: 40))
        img.addSubview(palyBtn)
    }
    
    public var item: HomePopularItem? {
       didSet {
           guard let item = item else { return }
           if item.entry?.content?.trimmingCharacters(in: .whitespaces).isEmpty ?? false {
              titleLab.text = "暂无标题"
            } else {
              titleLab.text = item.entry?.content?.trimmingCharacters(in: .whitespaces)
            }
            if !(item.entry?.gif?.isEmpty ?? true) {
                let urls = item.entry?.gif?.components(separatedBy: "?")
                let url = URL(string: urls?.first ?? "")
                self.img.sd_setImage(with: url)
            } else if !(item.entry?.photo?.isEmpty ?? true){
                let urls = item.entry?.photo?.components(separatedBy: "?")
                let url = URL(string: urls?.first ?? "")
                img.sd_setImage(with: url)
            } else {
                ///展位图
            }
            palyBtn.isHidden = (item.entry?.video?.isEmpty ?? true)
            ///更新约束
            let h = item.entry?.itemHeight ?? 200.0
            img.frame = CGRect.init(x: 0, y: 0, width: (DEVICE_WIDTH - 25) / 2, height: h - 30)
            titleLab.frame = CGRect.init(x: 0, y: h - 30, width: (DEVICE_WIDTH - 25) / 2, height: 30)
       }
    }
}

