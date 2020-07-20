import UIKit

public extension UIViewController {
    func configure(highlight: Highlight) {
        switch highlight {
        case .title(let string):
            title = string
        case .image:
            let logo = UIImage()
            let imageView = UIImageView(image: logo)
            navigationItem.titleView = imageView
        }
    }

    func configure(buttons: [UIBarButtonItem]) {
        navigationItem.setRightBarButtonItems(buttons, animated: true)
    }
}
