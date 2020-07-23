import UIKit

/**
  This is an extension that modifies the navigationItem titleView according to design system.

  The titleView changes according with the current Brand configured in the Design system
  and according with user properties of Light and Dark mode.

    This component has 2 styles:
    - Title
    - Logo

    Example of usage:
        viewController.configure(titleStyle: .logo)

 - Requires:
        It's necessary to configure the Design System current Brand at DesignSystem class
        or fatalError will be raised.
            DesignSystem().configure(with: Brand)
*/

public extension UIViewController {
    func configure(titleStyle: TitleStyle) {
        switch titleStyle {
        case .title(let string):
            navigationItem.titleView = nil
            title = string
        case .logo:
            let logo = NatLogoImages.horizontal
            let imageView = UIImageView(image: logo)

            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.widthAnchor.constraint(lessThanOrEqualToConstant: NatSizes.hugeX).isActive = true
            imageView.contentMode = .scaleAspectFit
            navigationItem.titleView = imageView
        }
    }

    /**
     This method has the objective to set the rightBarButtonItems of navigationItem.

        Example of usage:
            let barItems: [UIBarButtonItem] = [
                UIBarButtonItem(icon: .outlinedActionCalendar, action: nil, target: nil)
            ]
            viewController.configure(buttons: barItems)

     - Parameters:
        - buttons: Array of UIBarButtonItem.
    */

    func configure(buttons: [UIBarButtonItem]) {
        var itemButtons = buttons

        if !buttons.isEmpty {
            let navbarRightPadding = getBarButtonItemSpacing(width: NatSizes.tiny)
            itemButtons.insert(navbarRightPadding, at: 0)
        }

        navigationItem.setRightBarButtonItems(itemButtons, animated: true)
    }

    private func getBarButtonItemSpacing(width: CGFloat) -> UIBarButtonItem {
        let barButtonItemSpacing = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        barButtonItemSpacing.width = width
        return barButtonItemSpacing
    }
}
