//
//  StringExtension.swift
//  Keep
//
//  Created by 顾钱想 on 2020/8/21.
//  Copyright © 2020 顾钱想. All rights reserved.
//

import Foundation
import MBProgressHUD




public class HUD {

    // MARK: - 显示一个 Toast
    class func show(_ message: String?,
                    duration: TimeInterval = 1) {

        let view = viewToShow()
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .text
        hud.label.text = message
        hud.label.numberOfLines = 0
        hud.hide(animated: true, afterDelay: duration)
        hud.removeFromSuperViewOnHide = true
    }

    // MARK: - 显示一个 GIF 动画
    @discardableResult
    class func showLoading(v: UIView?) -> MBProgressHUD {
        ///先关闭上一个Loading
        if let managerhud = HUDManager.shared.hud {
           managerhud.hide(animated: true)
        }
        let view: UIView = ((v != nil ? v : viewToShow()) ?? UIView())
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .customView
        let gifImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        gifImageView.contentMode = .scaleAspectFit
        gifImageView.backgroundColor = .clear
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
    class func hide(_ hud: MBProgressHUD?) {
        hud?.hide(animated: true)
    }

    // 获取用于显示提示框的view
    class func viewToShow() -> UIView {
        var window:UIWindow? = nil
        if #available(iOS 13.0, *) {
            window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        } else {
            window = UIApplication.shared.keyWindow
        }
        window?.endEditing(true)
        if window?.windowLevel != .normal {
            let windowArray = UIApplication.shared.windows
            for tempWin in windowArray {
                if tempWin.windowLevel == .normal {
                    window = tempWin
                    break
                }
            }
        }
        return window ?? UIView()
    }
}
