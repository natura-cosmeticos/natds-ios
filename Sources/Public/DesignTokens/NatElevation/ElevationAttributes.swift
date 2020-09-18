extension NatElevation {
    struct ElevationAttributes {
        let shadowColor: CGColor?
        let shadowOffSet: CGSize
        let shadowRadius: CGFloat
        let shadowOpacity: Float
    }
}

extension NatElevation.ElevationAttributes {
    static var elevationNone: NatElevation.ElevationAttributes {
        .init(
            shadowColor: nil,
            shadowOffSet: .init(width: 0, height: -3),
            shadowRadius: 3,
            shadowOpacity: 0
        )
    }

    static var elevation01: NatElevation.ElevationAttributes {
        .init(
            shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
            shadowOffSet: .init(width: 0, height: 1),
            shadowRadius: 1,
            shadowOpacity: 0.14
        )
    }

    static var elevation02: NatElevation.ElevationAttributes {
        .init(
            shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
            shadowOffSet: .init(width: 0, height: 2),
            shadowRadius: 2,
            shadowOpacity: 0.14
        )
    }

    static var elevation03: NatElevation.ElevationAttributes {
        .init(
            shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
            shadowOffSet: .init(width: 0, height: 3),
            shadowRadius: 4,
            shadowOpacity: 0.14
        )
    }

    static var elevation04: NatElevation.ElevationAttributes {
        .init(
            shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
            shadowOffSet: .init(width: 0, height: 4),
            shadowRadius: 5,
            shadowOpacity: 0.14
        )
    }

    static var elevation05: NatElevation.ElevationAttributes {
        .init(
            shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
            shadowOffSet: .init(width: 0, height: 6),
            shadowRadius: 10,
            shadowOpacity: 0.14
        )
    }

    static var elevation06: NatElevation.ElevationAttributes {
        .init(
            shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
            shadowOffSet: .init(width: 0, height: 8),
            shadowRadius: 10,
            shadowOpacity: 0.14
        )
    }

    static var elevation07: NatElevation.ElevationAttributes {
        .init(
            shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
            shadowOffSet: .init(width: 0, height: 9),
            shadowRadius: 12,
            shadowOpacity: 0.14
        )
    }

    static var elevation08: NatElevation.ElevationAttributes {
        .init(
            shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
            shadowOffSet: .init(width: 0, height: 12),
            shadowRadius: 17,
            shadowOpacity: 0.14
        )
    }

    static var elevation09: NatElevation.ElevationAttributes {
        .init(
            shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
            shadowOffSet: .init(width: 0, height: 16),
            shadowRadius: 24,
            shadowOpacity: 0.14
        )
    }

    static var elevation10: NatElevation.ElevationAttributes {
        .init(
            shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor,
            shadowOffSet: .init(width: 0, height: 24),
            shadowRadius: 38,
            shadowOpacity: 0.14
        )
    }
}
