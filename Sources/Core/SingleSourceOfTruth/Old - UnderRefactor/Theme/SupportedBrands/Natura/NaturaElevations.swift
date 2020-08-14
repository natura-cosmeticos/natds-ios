final class NaturaElevations: Elevations {
    lazy var none: ElevationAttributes = .init(
        shadowColor: nil,
        shadowOffSet: .init(width: 0, height: -3),
        shadowRadius: 3,
        shadowOpacity: 0
    )

    lazy var elevation01: ElevationAttributes = .init(
        shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
        shadowOffSet: .init(width: 0, height: 1),
        shadowRadius: 1,
        shadowOpacity: 0.14
    )

    lazy var elevation02: ElevationAttributes = .init(
        shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
        shadowOffSet: .init(width: 0, height: 2),
        shadowRadius: 2,
        shadowOpacity: 0.14
    )

    lazy var elevation03: ElevationAttributes = .init(
        shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
        shadowOffSet: .init(width: 0, height: 3),
        shadowRadius: 4,
        shadowOpacity: 0.14
    )

    lazy var elevation04: ElevationAttributes = .init(
        shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
        shadowOffSet: .init(width: 0, height: 4),
        shadowRadius: 5,
        shadowOpacity: 0.14
    )

    lazy var elevation05: ElevationAttributes = .init(
        shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
        shadowOffSet: .init(width: 0, height: 6),
        shadowRadius: 10,
        shadowOpacity: 0.14
    )

    lazy var elevation06: ElevationAttributes = .init(
        shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
        shadowOffSet: .init(width: 0, height: 8),
        shadowRadius: 10,
        shadowOpacity: 0.14
    )

    lazy var elevation07: ElevationAttributes = .init(
        shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
        shadowOffSet: .init(width: 0, height: 9),
        shadowRadius: 12,
        shadowOpacity: 0.14
    )

    lazy var elevation08: ElevationAttributes = .init(
        shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
        shadowOffSet: .init(width: 0, height: 12),
        shadowRadius: 17,
        shadowOpacity: 0.14
    )

    lazy var elevation09: ElevationAttributes = .init(
        shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
        shadowOffSet: .init(width: 0, height: 16),
        shadowRadius: 24,
        shadowOpacity: 0.14
    )

    lazy var elevation10: ElevationAttributes = .init(
        shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
        shadowOffSet: .init(width: 0, height: 24),
        shadowRadius: 38,
        shadowOpacity: 0.14
    )
}
