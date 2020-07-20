import UIKit

public extension UINavigationController {
    func configure(style color: Color) {
        navigationBar.tintColor = color.title
        navigationBar.barTintColor = color.background
        NatElevation.apply(on: navigationBar, elevation: .elevation02)
        navigationBar.shadowImage = UIImage()
    }
}
