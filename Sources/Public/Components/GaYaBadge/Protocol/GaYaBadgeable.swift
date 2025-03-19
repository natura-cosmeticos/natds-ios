//
//  GaYaBadgeable.swift
//  GaYa DS
//
//  Created by Hayna.Cardoso on 13/02/25.
//  Copyright © 2025 Natura. All rights reserved.
//

public protocol GaYaBadgeable: UIView {}

extension GaYaBadgeable {

    private var badge: GaYaBadge? {
        return subviews.compactMap { $0 as? GaYaBadge }.first
    }

    public func configure(badgeStyle style: GaYaBadge.Style, withColor color: GaYaBadge.Color, theme: AvailableTheme = .none) {
        guard badge == nil else { return }

        let badge = GaYaBadge(style: style, color: color, theme: theme)
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

    public func configure(limit: GaYaBadge.Limit) {
        badge?.configure(limit: limit)
    }
}

