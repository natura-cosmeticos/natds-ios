import UIKit
/**
 NatCard is a class that represents the Card component from the design system.
 It's necessary to instantiate it and set its height and width constraints.

 Example of usage:

     card.configure(elevation: true)
     card.configure(borderRadius: true)

 - Requires:
 It's necessary to configure the Design System with a theme or fatalError will be raised.

        DesignSystem().configure(with: AvailableTheme)
 */

public final class NatCard: UIView {

    public init() {
        super.init(frame: .zero)
        self.backgroundColor = getUIColorFromTokens(\.colorSurface)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods
    
    /// Sets if the card has elevation
    /// - Parameter elevation: a bool that indicates if the card has elevation
    public func configure(elevation: Bool) {
        if elevation {
            NatElevation.apply(on: self, elevation: .micro)
        } else {
            NatElevation.apply(on: self, elevation: .none)
        }
    }
    
    /// Sets if the card has rounded corners
    /// - Parameter borderRadius: a bool that indicates if the card has rounded corners
    public func configure(borderRadius: Bool) {
        if borderRadius {
            self.layer.cornerRadius = getTokenFromTheme(\.borderRadiusMedium)
        } else {
            self.layer.cornerRadius = getTokenFromTheme(\.borderRadiusNone)
        }
    }
}
