import UIKit

public extension UIBarButtonItem {
    convenience init(icon: Icon, action: Selector, target: AnyObject) {
        let iconView = IconView(fontSize: 25)
        iconView.icon = icon
        self.init(customView: iconView)
        let tap = UITapGestureRecognizer(target: target, action: action)
        iconView.addGestureRecognizer(tap)
    }
}
