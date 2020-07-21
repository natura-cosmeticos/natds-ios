import UIKit

public extension UIViewController {
    func configure(titleStyle: TitleStyle) {
        switch titleStyle {
        case .title(let string):
            title = string
        case .logo:
            let logo = UIImage()
            let imageView = UIImageView(image: logo)
            navigationItem.titleView = imageView
        }
    }

    func configure(buttons: [UIBarButtonItem]) {
        navigationItem.setRightBarButtonItems(buttons, animated: true)
    }
}
