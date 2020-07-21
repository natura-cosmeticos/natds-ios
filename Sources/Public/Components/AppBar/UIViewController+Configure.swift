import UIKit

public extension UIViewController {
    func configure(titleStyle: TitleStyle) {
        switch titleStyle {
        case .title(let string):
            title = string
        case .logo:
            let logo = NatLogoImages.horizontal
            let imageView = UIImageView(image: logo)

            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.widthAnchor.constraint(lessThanOrEqualToConstant: 128).isActive = true
            imageView.contentMode = .scaleAspectFit
            navigationItem.titleView = imageView
        }
    }

    func configure(buttons: [UIBarButtonItem]) {
        navigationItem.setRightBarButtonItems(buttons, animated: true)
    }
}
