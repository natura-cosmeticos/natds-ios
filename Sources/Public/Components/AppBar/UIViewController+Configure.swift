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
        It's necessary to configure the Design System with a theme or fatalError will be raised.
 
            DesignSystem().configure(with: AvailableTheme)
*/

public extension UIViewController {

    func configure(actionRight items: [UIView]) {
        var barButtonItems: [UIBarButtonItem] = []
        if items.count <= 3 {
            items.forEach { item in
                barButtonItems.append(UIBarButtonItem(customView: item))
            }
            navigationItem.rightBarButtonItems = barButtonItems
        }
    }

    func configure(actionLeft item: UIView) {
        let barButtonItem = UIBarButtonItem(customView: item)
        navigationItem.leftBarButtonItem = barButtonItem
    }

    func configure(position: TitlePosition) {
        switch position {
        case .left(let string):
            let titleLabel = UILabel()
            titleLabel.text = string
            titleLabel.textAlignment = .left
            titleLabel.textColor = self.navigationController?.navigationBar.tintColor
            titleLabel.translatesAutoresizingMaskIntoConstraints = false

            navigationItem.titleView = titleLabel

            guard let containerView = self.navigationItem.titleView?.superview else { return }
            if let navigationBar = navigationController?.navigationBar {
                NSLayoutConstraint.activate([
                    titleLabel.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor,
                                                        constant: NatSizes.semi),
                    titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
                    titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
                    titleLabel.widthAnchor.constraint(lessThanOrEqualToConstant: NatSizes.hugeX)
                ])
            }
        case .center(let string):
            navigationItem.titleView = nil
            title = string
        }
    }

    @available(*, deprecated, message: "TitleStyle is deprecated, check AppBar documentation")
    func configure(titleStyle: TitleStyle) {
        switch titleStyle {
        case .title(let string):
            navigationItem.titleView = nil
            title = string
        case .logo:
            let logo = AssetsHelper.logo(from: getTokenFromTheme(\.assetBrandNeutralA))
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
        let itemButtons = setSpacingBetween(buttons: buttons)
        navigationItem.setRightBarButtonItems(itemButtons, animated: true)
    }

    private func setSpacingBetween(buttons: [UIBarButtonItem]) -> [UIBarButtonItem] {
        var buttons = buttons

        let totalButtons = (buttons.count * 2)

        for index in stride(from: 1, to: totalButtons, by: 2) {
            buttons.insert(getBarButtonItemSpacing(width: 16), at: index)
        }

        if !buttons.isEmpty {
            let navbarRightPadding = getBarButtonItemSpacing(width: NatSizes.tiny)
            buttons.insert(navbarRightPadding, at: 0)
        }

        return buttons
    }

    private func getBarButtonItemSpacing(width: CGFloat) -> UIBarButtonItem {
        let barButtonItemSpacing = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        barButtonItemSpacing.width = width
        return barButtonItemSpacing
    }
}
