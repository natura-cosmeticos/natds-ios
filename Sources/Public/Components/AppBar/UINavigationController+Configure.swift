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
    private func clearNavigationBarView() {
        navigationBar.subviews.forEach { $0.removeFromSuperview() }
    }
    func configure(style: AppBarStyle) {
        clearNavigationBarView()
        if style == .base {
        
        } else {
            // adicionar a view do titulo e deixar os espacos pras actions (1 esquerda e 3 direita)
            // permitir os botoes e tudo mais
        }
    }

    func configure(color: AppBarColor) {
        navigationBar.shadowImage = UIImage()
        navigationBar.barTintColor = color.backgroundColor
        navigationBar.tintColor = color.contentColor
        navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: color.contentColor
        ]
    }

    func configure(elevation: Bool) {
        if elevation {
            NatElevation.apply(on: navigationBar, elevation: .tiny)
        } else {
            NatElevation.apply(on: navigationBar, elevation: .none)
        }
    }

    func configure(contentPosition: Position) {
        clearNavigationBarView()
        configure(style: .standard)
        if contentPosition == .left {
            
        }
        
    }

    func configure(actionRight: [UIView]) {
        
    }

    func configure(actionLeft: UIView) {}

    // Essa func foi substituída pela primeira dessa classe. Pq Style virou AppBarStyle, e são outros estilos
//    func configure(style: Style) {
//        navigationBar.tintColor = style.titleColor
//        navigationBar.barTintColor = style.backgroundColor
//        NatElevation.apply(on: navigationBar, elevation: style.elevation)
//        navigationBar.shadowImage = UIImage()
//
//        navigationBar.titleTextAttributes = [
//            NSAttributedString.Key.foregroundColor: NatColors.highEmphasis
//        ]
//    }
}
