//
//  WaterfallHeadView.swift
//Users/guqianxiang/Desktop/Git/ExtraLife/ExtraLife/Classes/Modules/Diet(餐饮)/Recommend(饮食推荐)/List/View/Cell/DietRecommendListCell.swift/  Keep
//
//  Created by 顾钱想 on 2020/9/7.
//  Copyright © 2020 顾钱想. All rights reserved.
//

import UIKit
import YYWebImage
class WaterfallHeadView: UIView {

    var headImg: UIImageView!
    var userNameLab: UILabel!
    var subtitleLab: UILabel!
    var attentionBtn: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.makeUI()
    }


    public var author: HomeRecommentAuthor? {
      didSet {
         guard let author = author else { return }
         let url = URL(string: author.avatar ?? "")
         if ((url) != nil) {
            headImg.sd_setImage(with: url)
         }
         userNameLab.text = author.username ?? ""
         subtitleLab.text = author.desc ?? ""
      }
    }

    public var attentAuthor: HomeAttentionAuthor? {
       didSet {
          guard let author = attentAuthor else { return }
          let url = URL(string: author.avatar ?? "")
          if ((url) != nil) {
            headImg.yy_setImage(with: url, placeholder: nil, options: [], manager: nil, progress: nil, transform: { (image, url) -> UIImage? in
                return image.yy_image(byRoundCornerRadius: 20) ?? UIImage()
            }) { (image, url, type, _, _) in
                if (type == .diskCache || type == .memoryCache || type == .memoryCacheFast) {
                   //print("图片缓存")
                }
            }
              //headImg.sd_setImage(with: url, completed: nil)
          }
          userNameLab.text = author.username ?? ""
          subtitleLab.text = author.desc ?? ""
       }
    }
    func makeUI() {
        self.backgroundColor = .white
        headImg = UIImageView.init(frame: CGRect.init(x: KHomeContentInset, y: 13, width: 40, height: 40))
        self.addSubview(headImg)

        userNameLab = UILabel.init(frame: CGRect.init(x: headImg.right + 10, y: headImg.top, width: DEVICE_WIDTH - headImg.right - 100, height: 20))
        userNameLab.font = .boldSystemFont(ofSize: 14)
        userNameLab.textColor = .black
        self.addSubview(userNameLab)

        subtitleLab = UILabel.init(frame: CGRect.init(x: headImg.right + 10, y: userNameLab.bottom, width: DEVICE_WIDTH - headImg.right - 80, height: 20))
        subtitleLab.font = .systemFont(ofSize: 12)
        subtitleLab.textColor = .darkGray
        self.addSubview(subtitleLab)

        attentionBtn = UIButton.init(frame: CGRect.init(x: userNameLab.right + 10, y: 18, width: 70 , height: 30))
        attentionBtn.layer.cornerRadius = 15
        attentionBtn.backgroundColor = .colorWithHex(hexColor: 0xAFEEEE)
        attentionBtn.titleLabel?.font = .systemFont(ofSize: 14)
        attentionBtn.setTitle("关注", for: .normal)
        self.addSubview(attentionBtn)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
