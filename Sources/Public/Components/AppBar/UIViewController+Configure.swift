import UIKit

public extension UIViewController {
    func configure(highlight: Highlight) {
        switch highlight {
        case .title(let string):
            title = string
        case .image:
            let iconView = IconView(fontSize: 25)
            let icon = Icon.filledActionDelete
            iconView.icon = icon
            navigationItem.titleView = iconView
        }
    }

    func configure(button: [UIBarButtonItem]) {
        navigationItem.setRightBarButtonItems(button, animated: true)
    }
}
