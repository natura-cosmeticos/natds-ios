import UIKit

public protocol NatAppBarBuilder: AnyObject {
    var viewModel: NatAppBar.ViewModel { get }
}

extension NatAppBarBuilder {
    public func build(rootViewController: UIViewController = UIViewController()) -> NatAppBar {
        return .init(viewModel: viewModel, rootViewController: rootViewController)
    }
}
