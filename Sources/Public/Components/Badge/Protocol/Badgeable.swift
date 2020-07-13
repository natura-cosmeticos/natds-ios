public protocol Badgeable: UIView {}

extension Badgeable {

    public func addBadge(style: NatBadge.Style, color: NatBadge.Color) {
        let badge = NatBadge(style: style, color: color)
        addSubview(badge)

        let constraints = [
            badge.centerXAnchor.constraint(equalTo: trailingAnchor, constant: 0.8536),
            badge.centerYAnchor.constraint(equalTo: topAnchor, constant: 0.1464)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    public func setBadgeIsHidden(_ hidden: Bool) {
        subviews.compactMap { $0 as?  NatBadge }.first?.isHidden = hidden
    }

    public func setBadge(count: Int) {
        subviews.compactMap { $0 as?  NatBadge }.first?.configure(count: count)
    }

    public func removeBadge() {
        subviews.compactMap { $0 as?  NatBadge }.first?.removeFromSuperview()
    }
}
