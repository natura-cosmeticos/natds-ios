import Foundation

public class NatSelectionControl: UIView {

    private let style: Style

    private lazy var selectorView: UIControl = {
        let view = style.getSelector()
        return view
    }()

    public init(style: Style) {
        self.style = style
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(selectorView)
        setupStyle()
    }
}

extension NatSelectionControl {
    private func setupStyle() {
        switch style {
        case .checkbox: setupCheckbox()
        }
    }

    private func setupCheckbox() {
        let margin: CGFloat = 8

        selectorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin).isActive = true
        selectorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -margin).isActive = true
        selectorView.topAnchor.constraint(equalTo: topAnchor, constant: margin).isActive = true
        selectorView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -margin).isActive = true
    }
}
