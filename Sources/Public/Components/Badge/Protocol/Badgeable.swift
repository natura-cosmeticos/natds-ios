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
            badge.trailingAnchor.constraint(equalTo: trailingAnchor),
            badge.topAnchor.constraint(equalTo: topAnchor, constant: 0.1)
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
