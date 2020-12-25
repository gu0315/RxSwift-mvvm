//
//  AttentionViewTableViewCell.swift
//  Keep
//
//  Created by 顾钱想 on 2020/9/12.
//  Copyright © 2020 顾钱想. All rights reserved.
//

import UIKit
import Foundation
import YYText


class AttentionViewTableViewCell: UITableViewCell {
    var headView: WaterfallHeadView!
    var footView: WaterfallFootView!
    var contentLabel: YYLabel!
    var moreBtn: UIButton!
    var photoContainerView: PhotoContainerView!
    let headHeight: CGFloat = 66
    required init?(coder aDecoder:NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(style:UITableViewCell.CellStyle, reuseIdentifier:String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        self.makeUI()
    }

    var disposeBag = DisposeBag()
    //单元格重用时调用
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }

    public var item: HomeAttentionItem? {
        didSet {
            guard let item = item else { return }
            contentLabel.attributedText = item.recommendEntry?.contentAttributed
            var moreBtnheight: CGFloat = 0
            ///文本高度
            let contentLabelheight = item.recommendEntry?.isClickMore ?? false ?  item.recommendEntry?.contentAllHeight ?? 0 :  item.recommendEntry?.contentHeight ?? 0
            moreBtn.isSelected = item.recommendEntry?.isClickMore ?? false
            ///显示更多
            if ceilf(Float(item.recommendEntry?.contentAllHeight ?? 0)) > 250.0 {
                moreBtn.isHidden = false
                moreBtnheight = 35
            } else  {
                moreBtn.isHidden = true
            }
            headView.attentAuthor = item.recommendEntry?.author
            photoContainerView.setImageUrl(picPathArr: item.recommendEntry?.images ?? [])
            footView.configData(likes: item.recommendEntry?.likes, conments: item.recommendEntry?.comments, hasLiked: item.recommendEntry?.hasLiked ?? false)

            ///更新约束
            headView.frame = CGRect.init(x: 0, y: 0, width: DEVICE_WIDTH, height: headHeight)
            contentLabel.frame = CGRect.init(x: 0, y: headView.bottom, width: DEVICE_WIDTH, height: contentLabelheight)
            moreBtn.frame = CGRect.init(x: 0, y: contentLabel.bottom, width: DEVICE_WIDTH, height: moreBtnheight)
            photoContainerView.frame = CGRect.init(x: 0, y: moreBtn.bottom, width: DEVICE_WIDTH, height: item.recommendEntry?.imagesHeight ?? 0)
            footView.frame = CGRect.init(x: 0, y: photoContainerView.bottom, width: DEVICE_WIDTH, height: CGFloat(40))
        }
    }

    func makeUI() {
        self.contentView.backgroundColor = UIColor.colorWithHex(hexColor: 0xF5F5F5)
        headView = WaterfallHeadView.init(frame: CGRect.init(x: 0, y: 0, width: DEVICE_WIDTH, height: headHeight))
        self.contentView.addSubview(headView)

        contentLabel = YYLabel.init(frame: CGRect.init(x: KHomeContentInset, y: headView.bottom, width: DEVICE_WIDTH - KHomeContentInset * 2, height: 110))
        contentLabel.numberOfLines = 0
        contentLabel.backgroundColor = .white
        contentLabel.lineBreakMode = .byCharWrapping

        contentLabel.textContainerInset = UIEdgeInsets.init(top: 5, left: KHomeContentInset, bottom: 10, right: KHomeContentInset)

        // YYLabel要想自动换行，必须设置最大换行的宽度
        contentLabel.preferredMaxLayoutWidth = DEVICE_WIDTH - KHomeContentInset * 2
        contentLabel.textAlignment = .center
        contentLabel.textVerticalAlignment = .center
        contentLabel.font = .systemFont(ofSize: 16)
        self.contentView.addSubview(contentLabel)

        moreBtn = UIButton.init(frame: CGRect.init(x: 0, y: contentLabel.bottom, width: 100, height: 0))
        moreBtn.backgroundColor = .white
        moreBtn.isSelected = false
        moreBtn.isHidden = true
        moreBtn.titleLabel?.font = .systemFont(ofSize: 16)
        moreBtn.contentHorizontalAlignment = .left
        moreBtn.setTitleColor(.blue, for: .normal)
        moreBtn.setTitle("    更多", for: .normal)
        moreBtn.setTitle("    收起", for: .selected)
        self.contentView.addSubview(moreBtn)

        photoContainerView = PhotoContainerView.init(frame: CGRect.init(x: KHomeContentInset, y: moreBtn.bottom, width: DEVICE_WIDTH - KHomeContentInset * 2, height: 300))
        self.contentView.addSubview(photoContainerView)

        footView = WaterfallFootView.init(frame: CGRect.init(x: 0, y: 100, width: DEVICE_WIDTH, height: 40))
        self.contentView.addSubview(footView)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
