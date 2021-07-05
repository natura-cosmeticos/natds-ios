/**
 This is an extension that modifies the navigationBar views according to the Design System.
 It represents the component AppBar - Top.
 
 Examples of usage:
 
        viewController.configure(actionRight: [iconButton, customView])
        viewController.configure(actionLeft: iconButton)
 
 - Requires:
        It's necessary to configure the Design System with a theme or fatalError will be raised.
 
            DesignSystem().configure(with: AvailableTheme)
*/

public extension UIViewController {
    
    /// Sets the action right items for the navigation bar
    /// The items can be any of UIView, including other components from the Design System
    /// The max number of items that can be configured is 3.
    ///
    /// - Parameter items: an array of UIViews
    func configure(actionRight items: [UIView]) {
        var barButtonItems: [UIBarButtonItem] = []
        if items.count <= 3 {
            items.forEach { item in
                barButtonItems.append(UIBarButtonItem(customView: item))
            }
            navigationItem.rightBarButtonItems = barButtonItems
        }
    }
    
    /// Sets the action left item for the navigation bar
    /// If there's a 'back' action already in use, it overrides it
    /// The item can be any UIView, including other componentes from the Design System
    ///
    /// - Parameter item: an UIView
    func configure(actionLeft item: UIView) {
        let barButtonItem = UIBarButtonItem(customView: item)
        navigationItem.leftBarButtonItem = barButtonItem
    }
    
    /// Sets the position for the titleView in the navigation bar
    /// - Parameter position: an option from `TitlePosition` enum
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

    /// Sets rightBarButtonItems for the navigation bar
    ///
    /// Example of usage:
    ///
    ///             let barItems: [UIBarButtonItem] = [UIBarButtonItem(icon: .outlinedActionCalendar, action: nil, target: nil)]
    ///             viewController.configure(buttons: barItems)
    ///
    /// - Parameter buttons: an array of UIBarButtonItems
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
