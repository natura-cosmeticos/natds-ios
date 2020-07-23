import UIKit

public extension UIBarButtonItem {
    convenience init(icon: Icon, action: Selector?, target: AnyObject?) {
        let iconView = IconView(fontSize: 24, icon: icon)
        self.init(customView: iconView)
        let tap = UITapGestureRecognizer(target: target, action: action)
        iconView.addGestureRecognizer(tap)
    }

    func setBadgeValue(_ count: Int) {
        let badgeableView = customView as? Badgeable
        badgeableView?.configure(badgeStyle: .standard, withColor: .alert)
        badgeableView?.setBadge(count: count)
    }
}

extension IconView: Badgeable {}
