import UIKit

/**
  This is an extension that modifies the navigationBar according to design system.

  The navigationBar changes according with the current Brand configured in the Design system
  and according with user properties of Light and Dark mode.

    This component has 1 style:
    - Default

    Example of usage:
        navigationController.configure(style: .default)

 - Requires:
        It's necessary to configure the Design System with a theme or fatalError will be raised.

            DesignSystem().configure(with: AvailableTheme)
*/

public extension UINavigationController {
    func configure(style: Style) {
        navigationBar.tintColor = style.titleColor
        navigationBar.barTintColor = style.backgroundColor
        NatElevation.apply(on: navigationBar, elevation: style.elevation)
        navigationBar.shadowImage = UIImage()

        navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: NatColors.highEmphasis
        ]
    }
}
