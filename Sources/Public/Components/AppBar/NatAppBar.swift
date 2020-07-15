import UIKit

public class NatAppBar: UINavigationController {
    private let viewModel: ViewModel
    private let rootViewController: UIViewController

    // MARK: - Inits

    init(viewModel: ViewModel, rootViewController: UIViewController) {
        self.viewModel = viewModel
        self.rootViewController = rootViewController

        super.init(rootViewController: rootViewController)

        setup()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        navigationBar.tintColor = getTheme().colors.highEmphasis
        navigationBar.barTintColor = viewModel.color?.value
        NatElevation.apply(on: navigationBar, elevation: .elevation02)
        navigationBar.shadowImage = UIImage()
        
        if viewModel.hightlight == .image {
            let iconView = IconView(fontSize: 25)
            let icon = Icon.filledActionDelete
            iconView.icon = icon
            rootViewController.navigationItem.titleView = iconView
        }
    }
}

extension NatAppBar {
    public func configure(barButtonTitle: String) {
        visibleViewController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: barButtonTitle, style: .plain, target: self, action: nil)
    }
}

extension NatAppBar {
    public static var standardStyleBuilder: StandardStyleBuilder { .init() }
}
