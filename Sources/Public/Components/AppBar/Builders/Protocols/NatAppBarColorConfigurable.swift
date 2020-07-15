import UIKit

public protocol NatAppBarColorConfigurable { }

extension NatAppBarColorConfigurable where Self: NatAppBarBuilder {
    @discardableResult
    public func configure(color: NatAppBar.Color) -> Self {
        viewModel.color = color
        return self
    }
}
