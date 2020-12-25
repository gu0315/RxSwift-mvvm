
import Foundation

public extension UIViewController {

    func startAnimating() {
        DispatchQueue.main.async {
            HUDManager.shared.hud = HUD.showLoading(v: nil)
        }
    }

    func stopAnimating() {
        DispatchQueue.main.async {
            HUDManager.shared.hud?.hide(animated: true)
        }
    }
}


