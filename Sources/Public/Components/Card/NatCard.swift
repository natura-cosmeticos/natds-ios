import UIKit

public final class NatCard: UIView {

    public init() {
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        self.backgroundColor = getUIColorFromTokens(\.colorSurface)
        self.layer.cornerRadius = getTokenFromTheme(\.borderRadiusMedium)
        NatElevation.apply(on: self, elevation: .micro)

        let padding = getTokenFromTheme(\.sizeSmall)
        bounds = frame.inset(by: UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding))
    }
}
