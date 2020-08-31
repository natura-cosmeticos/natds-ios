import Foundation

public final class NatIconButton: UIView {
    private let circularView: CircularView = {
        let view = CircularView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    public init() {
        super.init(frame: .zero)
        backgroundColor = .blue

        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(circularView)
        addConstraints()
    }

    private func addConstraints() {
        let circleSize = NatSizes.semiX

        let constraints = [
//            circularView.topAnchor.constraint(equalTo: topAnchor),
            circularView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            circularView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),
//            circularView.centerXAnchor.constraint(equalTo: centerXAnchor),
//            circularView.widthAnchor.constraint(equalToConstant: circleSize),
//            circularView.heightAnchor.constraint(equalToConstant: circleSize),

            circularView.centerXAnchor.constraint(equalTo: centerXAnchor),
            circularView.centerYAnchor.constraint(equalTo: centerYAnchor),

            circularView.heightAnchor.constraint(equalToConstant: circleSize),
            circularView.widthAnchor.constraint(equalToConstant: circleSize),
        ]

        NSLayoutConstraint.activate(constraints)
    }
}

final class CircularView: UIView {

    public init() {
        super.init(frame: .zero)
        backgroundColor = .red

        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private properties

    private let iconView: IconView = {
        let iconView = IconView(fontSize: getTokenFromTheme(\.sizeStandard))
        iconView.icon = .outlinedDefaultMockup
        iconView.translatesAutoresizingMaskIntoConstraints = false

        return iconView
    }()
}

// MARK: - Private methods - UI

extension CircularView {

    func configure(circleSize: CGFloat) {
        layer.cornerRadius = NatBorderRadius.circle(viewHeight: NatSizes.semiX)
    }

    private func setup() {
        addSubview(iconView)

        addConstraints()
    }

    private func addConstraints() {
        let constraints = [
            iconView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
