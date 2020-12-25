//
//  NVActivityIndicatorView+Rx.swift
//  Candy
//
//  Created by Insect on 2019/5/20.
//  Copyright © 2019 Insect. All rights reserved.
//

import Foundation
import MBProgressHUD

class HUDManager {
    static let shared = HUDManager()
    var hud: MBProgressHUD?
}

extension Reactive where Base: UIViewController {
    public var isAnimatingViewController: Binder<Bool> {
        return Binder(self.base) { vc, active in
            if active {
                HUDManager.shared.hud = HUD.showLoading(v: vc.view)
            } else {
                HUDManager.shared.hud?.hide(animated: true)
            }
        }
    }
    
    public var isAnimatingWindow: Binder<Bool> {
        return Binder(self.base) { vc, active in
            if active {
                HUDManager.shared.hud = HUD.showLoading(v: nil)
            } else {
                HUDManager.shared.hud?.hide(animated: true)
            }
        }
    }
}

extension Reactive where Base: UIView {

    public var isAnimatingView: Binder<Bool> {
        return Binder(self.base) { view, active in
            if active {
                HUDManager.shared.hud = HUD.showLoading(v: view)
            } else {
                HUDManager.shared.hud?.hide(animated: true)
            }
        }
    }

    public var isAnimatingWindow: Binder<Bool> {
          return Binder(self.base) { vc, active in
              if active {
                  HUDManager.shared.hud = HUD.showLoading(v: nil)
              } else {
                  HUDManager.shared.hud?.hide(animated: true)
              }
          }
      }
}
