extension NatCounter {
    /**
     Size is a enum that represents size values for NatCounter component.

     These are all sizes allowed for a NatCounter:
     - semi
     - medium

     - Requires:
     It's necessary to configure the Design System with a theme or fatalError will be raised.

            DesignSystem().configure(with: AvailableTheme)
     */

    public enum Size: CaseIterable {
        case semi
        case medium
    }
}

extension NatCounter.Size {
    var value: CGFloat {
        switch self {
        case .semi:
            return getTokenFromTheme(\.sizeSemi)
        case .medium:
            return getTokenFromTheme(\.sizeMedium)
        }
    }

    var borderRadius: CGFloat {
        return getComponentAttributeFromTheme(\.counterBorderRadius)
    }

    var buttonWidth: CGFloat {
        switch self {
        case .semi:
            return getTokenFromTheme(\.sizeSemi)
        case .medium:
            return getTokenFromTheme(\.sizeSemiX)
        }
    }

    var buttonHeight: CGFloat {
        switch self {
        case .semi:
            return getTokenFromTheme(\.sizeSemiX)
        case .medium:
            return getTokenFromTheme(\.sizeMedium)
        }
    }
}
