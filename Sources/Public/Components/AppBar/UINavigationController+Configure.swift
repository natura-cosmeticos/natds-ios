/**
 This is an extension that modifies the navigationBar according to the Design System.
 It represents the component AppBar - Top.
 
 - NOTE:
 This component is available in the following variants:
 - ✅ Standard
 - ⚠️ Base

 With the following attribute status:
 - ✅ Action right
 - ✅ Action left
 - Color:
    - ✅ `Default`
    - ✅ `Primary`
    - ✅ `None`
    - ✅ `Inverse`
 - Elevation:
    - ✅ `True`
    - ✅ `False`
 - Content position:
    - ✅ `Center` (default)
    - ⚠️ `Left`
 - Content type:
    - ✅ `Text`
    - ✅ `Media`
    - ⚠️ `Search`
 - Content proeminent:
    - ✅ `False` (default)
    - ⚠️ `True`
 - Behavior:
    - ✅ `Fixed` (default)
    - ⚠️ `Scroll`
 
 The navigation bar colors change accordint to the current brand configured and to the light/dark mode properties.
 The component is available only with the variant `standard`.
 
 Examples of usage:
 
            navigationController.configure(color: .primary)
            navigationController.configure(elevation: true)

 - Requires:
        It's necessary to configure the Design System with a theme or fatalError will be raised.

            DesignSystem().configure(with: AvailableTheme)
*/

public extension UINavigationController {
    /// Sets the color for navigation bar and its subviews
    /// - Parameter color: an option from `AppBarColor` enum
    func configure(appBarColor: AppBarColor, appBarContentType: AppBarContentType = .text("")) {
        navigationBar.barTintColor = appBarColor.backgroundColor
        navigationBar.tintColor = appBarColor.contentColor

        if #available(iOS 15.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.backgroundColor = appBarColor.backgroundColor
            navBarAppearance.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: appBarColor.contentColor
            ]
            navBarAppearance.shadowColor = .clear
            navBarAppearance.shadowImage = UIImage()
            navigationBar.standardAppearance = navBarAppearance
            navigationBar.scrollEdgeAppearance = navBarAppearance
        } else {
            navigationBar.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: appBarColor.contentColor
            ]
            navigationBar.shadowImage = UIImage()
        }
        
        var newLogo = UIImage()
        
        switch appBarContentType {
            case .colorLogo:
                switch appBarColor {
                    case .default:
                    newLogo = AssetsHelper.logo(from: getTokenFromTheme(\.assetBrandNeutralAFile))!
                    case.inverse:
                    newLogo = AssetsHelper.logo(from: getTokenFromTheme(\.assetBrandCustomAFile))!.tintedWithColor(getUIColorFromTokens(\.colorSurface))
                    case.none:
                    newLogo = AssetsHelper.logo(from: getTokenFromTheme(\.assetBrandNeutralAFile))!
                    case .primary:
                    newLogo = AssetsHelper.logo(from: getTokenFromTheme(\.assetBrandCustomAFile))!.tintedWithColor(getUIColorFromTokens(\.colorOnPrimary))
                    case .secondary:
                    newLogo = AssetsHelper.logo(from: getTokenFromTheme(\.assetBrandCustomAFile))!.tintedWithColor(getUIColorFromTokens(\.colorOnSecondary))
                }
            
            guard let topViewController = topViewController else { return }
            
            let imageView = UIImageView(image: newLogo)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.widthAnchor.constraint(lessThanOrEqualToConstant: NatSizes.largeXXX).isActive = true
            imageView.contentMode = .scaleAspectFit
            
            topViewController.navigationItem.titleView = imageView
                        
            case .text(_): break
            case .media(_): break
            case .logo(_): break
        }
        
    }

    /// Sets an elevation for the navigation bar, which adds a slight shadow to it
    /// - Parameter elevation: a boolean to add or remove the attribute
    func configure(appBarElevation: Bool) {
        if appBarElevation {
            NatElevation.apply(on: navigationBar, elevation: .tiny)
        } else {
            NatElevation.apply(on: navigationBar, elevation: .none)
        }
    }
}
