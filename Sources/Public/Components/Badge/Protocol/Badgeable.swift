public protocol Badgeable: UIView {}

extension Badgeable {

    private var badge: NatBadge? {
        return subviews.compactMap { $0 as? NatBadge }.first
    }

    public func configure(badgeStyle style: NatBadge.Style, withColor color: NatBadge.Color) {
        guard badge == nil else { return }

        let badge = NatBadge(style: style, color: color)
        addSubview(badge)

        let constraints = [
            badge.centerXAnchor.constraint(equalTo: trailingAnchor, constant: 0.85),
            badge.centerYAnchor.constraint(equalTo: topAnchor, constant: 0.14)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    public func setBadgeIsHidden(_ hidden: Bool) {
        badge?.isHidden = hidden
    }

    public func setBadge(count: Int) {
        badge?.configure(count: count)
    }

    public func removeBadge() {
       badge?.removeFromSuperview()
    }
}
