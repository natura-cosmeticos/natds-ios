import UIKit

public final class NatBadge: UIView {

    // MARK: - Public properties

    public var count: Int? {
        didSet {
            if case .standard = style, let number = count {
                label.text = string(for: number)
            }
        }
    }

    // MARK: - Private properties

    private let style: Style

    private let color: Color

    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .caption, withWeight: .regular)
        label.textColor = color.content
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Inits

    public init(style: Style, color: Color) {
        self.style = style
        self.color = color
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    private func setup() {
        backgroundColor = .clear
        if case .standard = style {
            addSubview(label)
            addConstraints()
        }
    }

    private func addConstraints() {
        translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.widthAnchor.constraint(greaterThanOrEqualToConstant: 10),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    override public func draw(_ rect: CGRect) {
        let path: UIBezierPath?

        switch style {
        case .standard:
            path = UIBezierPath(roundedRect: CGRect(origin: .zero, size: bounds.size),
                                cornerRadius: NatBorderRadius.circle(viewHeight: bounds.size.height))
        }

        color.box.set()
        path?.fill()
    }

    private func string(for count: Int) -> String? {
        return count > 99 ? "99+" : "\(count)"
    }

    // MARK: - Public methods

    public func remove() {
        removeFromSuperview()
    }

}
