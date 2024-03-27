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

public extension UINavigationController {

    func configureAppBar(color: AppBarColor, contentType: AppBarContentType = .text(""), hasTransparency: Bool = false, scrollView: UIScrollView? = nil) {

        NatElevation.apply(on: navigationBar, elevation: .none)
        navigationBar.barTintColor = color.backgroundColor
        navigationBar.tintColor = color.contentColor
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: color.contentColor]

        if hasTransparency {
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.shadowImage = UIImage()
            navigationBar.isTranslucent = true
            navigationBar.backgroundColor = UIColor.clear
            removeBottomLine()
        } else {
            navigationBar.isTranslucent = false
            navigationBar.backgroundColor = color.backgroundColor
        }

        if hasTransparency, let scrollView = scrollView {
            removeBottomLine()
            scrollView.addObserver(self, forKeyPath: "contentOffset", options: [.new], context: nil)
        }
    }
  
    func removeBottomLine() {
      navigationBar.shadowImage = nil
      navigationBar.layer.shadowColor = nil
      navigationBar.layer.shadowOpacity = 0.0
      
      if #available(iOS 13.0, *) {
        let appearance = navigationBar.standardAppearance.copy()
        appearance.shadowColor = nil // Remove a linha de sombra no iOS 13.0+
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
      }
    }

    override open func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentOffset", let scrollView = object as? UIScrollView {
            adjustNavigationBarTransparency(for: scrollView, threshold: 100) // Ajuste o threshold conforme necessário
        }
    }

    private func adjustNavigationBarTransparency(for scrollView: UIScrollView, threshold: CGFloat) {
        let offset = scrollView.contentOffset.y
        let alpha = min(1, max(0, offset / threshold))
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = navigationBar.barTintColor?.withAlphaComponent(alpha)
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
        }
    }
    
    func stopObservingScrollView(scrollView: UIScrollView) {
        scrollView.removeObserver(self, forKeyPath: "contentOffset")
    }
}

//public extension UINavigationController {
//
//    private struct TransparencyHandler {
//        static var handler: ((UIScrollView) -> Void)?
//    }
//
//    func setTransparencyHandler(handler: ((UIScrollView) -> Void)?) {
//        TransparencyHandler.handler = handler
//    }
//
//    func enableNavigationBarTransparency(for scrollView: UIScrollView, threshold: CGFloat = 100.0) {
//        scrollView.delegate = self // Atenção aqui, isso pode substituir um delegate existente.
//
//        setTransparencyHandler { scrollView in
//            let offsetY = scrollView.contentOffset.y
//            let alpha = min(max(offsetY / threshold, 0), 1)
//            self.navigationBar.alpha = alpha
//        }
//    }
//}
//
//extension UINavigationController: UIScrollViewDelegate {
//    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        TransparencyHandler.handler?(scrollView)
//    }
//}
