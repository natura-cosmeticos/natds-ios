import Foundation

extension NatAppBar {
    public final class StandardStyleBuilder {
        public let viewModel = ViewModel()

        public func configure(highlight: Highlight) {
            viewModel.hightlight = highlight
        }
    }
}

extension NatAppBar.StandardStyleBuilder: NatAppBarBuilder {}

extension NatAppBar.StandardStyleBuilder: NatAppBarColorConfigurable {}
