//
//  StringExtension.swift
//  Keep
//
//  Created by 顾钱想 on 2020/8/21.
//  Copyright © 2020 顾钱想. All rights reserved.
//

import Foundation
import MBProgressHUD
public extension UIView {

    func show(_ message: String?,
              duration: TimeInterval = 1) {
        let hud = MBProgressHUD.showAdded(to: self, animated: true)
        hud.mode = .text
        hud.label.text = message
        hud.hide(animated: true, afterDelay: duration)
        hud.removeFromSuperViewOnHide = true
    }

    @discardableResult
    func showLoading() -> MBProgressHUD {
        let hud = MBProgressHUD.showAdded(to: self, animated: true)
        hud.mode = .customView
        hud.bezelView.style = .solidColor
        let gifImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        gifImageView.backgroundColor = .clear
        gifImageView.contentMode = .scaleAspectFit
        //如果是gif可以使用sdwebImage的方法加载本地gif
        if let path = Bundle.main.path(forResource: "loading", ofType: "gif") {
           let data = NSData(contentsOfFile: path)
           let image = UIImage.sd_image(with: data as Data?)
           gifImageView.image = image;
        }
        hud.customView = gifImageView
        hud.removeFromSuperViewOnHide = true
        return hud
    }

    // MARK: - 隐藏
    func hide(_ hud: MBProgressHUD?) {
        hud?.hide(animated: true)
    }
}
