import UIKit

public extension UINavigationController {
    func configure(style: Style) {
        navigationBar.tintColor = style.titleColor
        navigationBar.barTintColor = style.backgroundColor
        NatElevation.apply(on: navigationBar, elevation: style.elevation)
        navigationBar.shadowImage = UIImage()
    }
}
