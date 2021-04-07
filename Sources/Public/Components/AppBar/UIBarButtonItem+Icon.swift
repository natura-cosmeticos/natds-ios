import UIKit

public extension UIBarButtonItem {
    convenience init(icon: String?, action: Selector?, target: AnyObject?) {
        let iconView = IconView(fontSize: 24, icon: icon)
        self.init(customView: iconView)
        let tap = UITapGestureRecognizer(target: target, action: action)
        iconView.addGestureRecognizer(tap)
    }

    @available(*, deprecated, message: "Use configure(badge:) instead")
    func setBadgeValue(_ count: Int) {
        let badgeableView = customView as? Badgeable
        badgeableView?.configure(badgeStyle: .standard, withColor: .alert)
        badgeableView?.setBadge(count: count)
    }

    /// Configures a badge to the bar button item.
    /// - Parameter badge: A badge from the design system.
    /// The badge must be created and configured before setting it to the icon button.
    ///
    /// Example:
    ///         let badge = NatBadge(style: .standard, color: .primary)
    ///         badge.configure(limit: .max99)
    ///         badge.configure(count: 100)
    ///         barButtonItem.configure(badge: badge)
    func configure(badge: NatBadge) {
        if let badge = customView?.subviews.compactMap({ $0 as? NatBadge }).first {
            badge.removeFromSuperview()
        }
        guard let customView = customView else { return }
        if badge.shouldAppear {
            customView.addSubview(badge)

            let constraints = [
                badge.trailingAnchor.constraint(equalTo: customView.trailingAnchor),
                badge.topAnchor.constraint(equalTo: customView.topAnchor, constant: 0.1)
            ]

            NSLayoutConstraint.activate(constraints)
        }
    }
}

extension IconView: Badgeable {}
