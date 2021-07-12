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
    func configure(appBarActionRight items: [UIView]) {
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
    func configure(appBarActionLeft item: UIView) {
        let barButtonItem = UIBarButtonItem(customView: item)
        navigationItem.leftBarButtonItem = barButtonItem
    }

    /// Sets the content type for the navigation bar's center view
    /// - Parameter item: an option from `AppBarContentType`, with a string value (for text) or an image (for media)
    func configure(appBarContentType item: AppBarContentType) {
        switch item {
        case .media(let image):
            let imageView = UIImageView(image: image)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.widthAnchor.constraint(lessThanOrEqualToConstant: NatSizes.hugeX).isActive = true
            imageView.contentMode = .scaleAspectFit
            navigationItem.titleView = imageView
        case .text(let string):
            navigationItem.titleView = nil
            title = string
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
