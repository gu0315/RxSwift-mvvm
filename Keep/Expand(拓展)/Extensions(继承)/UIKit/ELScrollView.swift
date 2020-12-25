

import UIKit

class ELScrollView: UIScrollView {

    //处理全屏手势
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if contentOffset.x <= 0 {
            guard let fullPopGestureDelegate: AnyClass = NSClassFromString("_FDFullscreenPopGestureRecognizerDelegate") else {
                return false
            }
            if otherGestureRecognizer.delegate?.isKind(of: fullPopGestureDelegate) ?? false {
                return true
            }
        }
        return false
    }
}
