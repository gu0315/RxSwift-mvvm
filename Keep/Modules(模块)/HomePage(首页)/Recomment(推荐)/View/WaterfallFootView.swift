//
//  WaterfallFootView.swift
//  Keep
//
//  Created by 顾钱想 on 2020/9/7.
//  Copyright © 2020 顾钱想. All rights reserved.
//

import UIKit

class WaterfallFootView: UIView {
    var likeBtn: UIButton!
    var commentBtn: UIButton!
    var moreBtn: UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.makeUI()
    }
    func makeUI() {
        self.backgroundColor = .white
        likeBtn = UIButton.init(frame: CGRect.init(x: KHomeContentInset, y: 0, width: 100, height: self.height))
        likeBtn.contentHorizontalAlignment = .left
        likeBtn.setImage(UIImage.init(named: "点赞"), for: .normal)
        likeBtn.setImage(UIImage.init(named: "已点赞"), for: .selected)
        likeBtn.titleLabel?.font = .systemFont(ofSize: 12)

        likeBtn.setTitleColor(.darkGray, for: .normal)
        likeBtn.setTitleColor(UIColor.init(red: 102/255, green: 192/255, blue: 58/255, alpha: 1), for: .selected)
        self.addSubview(likeBtn)

        commentBtn = UIButton.init(frame: CGRect.init(x: likeBtn.right, y: 0, width: 100, height: self.height))
        commentBtn.contentHorizontalAlignment = .left
        commentBtn.setImage(UIImage.init(named: "评论"), for: .normal)
        commentBtn.titleLabel?.font = .systemFont(ofSize: 12)
        commentBtn.setTitleColor(.darkGray, for: .normal)
        self.addSubview(commentBtn)


        moreBtn = UIButton.init(frame: CGRect.init(x: DEVICE_WIDTH - 100, y: 0, width: 85, height: self.height))
        moreBtn.contentHorizontalAlignment = .right
        moreBtn.setImage(UIImage.init(named: "更多"), for: .normal)
        moreBtn.setTitleColor(.darkGray, for: .normal)
        self.addSubview(moreBtn)

    }

    func configData(likes: Int?, conments: Int?, hasLiked: Bool = false) {
        likeBtn.setTitle("\(likes ?? 0)", for: .normal)
        likeBtn.setTitle("\(likes ?? 0)", for: .selected)
        likeBtn.isSelected = hasLiked
        commentBtn.setTitle("\(conments ?? 0)", for: .normal)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
