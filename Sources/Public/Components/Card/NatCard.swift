import UIKit
/**
 NatCard is a class that represents Card component from the design system.

 It's necessary instantiate and set its height and widht constraints.

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

        setupPadding()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupPadding() {
        let padding = getTokenFromTheme(\.sizeSmall)
        bounds = frame.inset(by: UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding))
    }

    public func configure(elevation: Bool) {
        if elevation {
            NatElevation.apply(on: self, elevation: .micro)
        }
    }

    public func configure(borderRadius: Bool) {
        if borderRadius {
            self.layer.cornerRadius = getTokenFromTheme(\.borderRadiusMedium)
        }
    }
}
