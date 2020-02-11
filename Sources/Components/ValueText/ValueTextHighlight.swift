import Foundation

class ValueTextHighlight: UIView {

    private lazy var topDivider: Divider = {
        return Divider()
    }()

    private lazy var bottomDivider: Divider = {
        return Divider()
    }()

    private lazy var valueDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.body2
        label.textColor = Colors.Content.mediumEmphasis
        label.textAlignment = .left

        return label
    }()

    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.h5
        label.textColor = Colors.highlight
        label.textAlignment = .right

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ValueTextHighlight {
    var valueDescription: String? {
        get { return valueDescriptionLabel.text }
        set { valueDescriptionLabel.text = newValue }
    }

    var value: String? {
        get { return valueLabel.text }
        set { valueLabel.text = newValue }
    }
}

extension ValueTextHighlight {

    private func setup() {
        self.backgroundColor = .clear
        addTopDivider()
        addBottomDivider()
        addValueLabel()
        addValueDescriptionLabel()
    }

    private func addTopDivider() {
        self.addSubview(topDivider)
        topDivider.translatesAutoresizingMaskIntoConstraints = false

        let contraints = [
            topDivider.topAnchor.constraint(equalTo: topAnchor),
            topDivider.leadingAnchor.constraint(equalTo: leadingAnchor),
            topDivider.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]

        NSLayoutConstraint.activate(contraints)
    }

    private func addBottomDivider() {
        self.addSubview(bottomDivider)
        bottomDivider.translatesAutoresizingMaskIntoConstraints = false

        let contraints = [
            bottomDivider.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomDivider.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomDivider.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]

        NSLayoutConstraint.activate(contraints)
    }

    private func addValueLabel() {
        self.addSubview(valueLabel)
        valueLabel.translatesAutoresizingMaskIntoConstraints = false

        let contraints = [
            valueLabel.topAnchor.constraint(equalTo: topDivider.bottomAnchor, constant: 20),
            valueLabel.bottomAnchor.constraint(equalTo: bottomDivider.topAnchor, constant: -20),
            valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ]

        NSLayoutConstraint.activate(contraints)
    }

    private func addValueDescriptionLabel() {
        self.addSubview(valueDescriptionLabel)
        valueDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        let contraints = [
            valueDescriptionLabel.topAnchor.constraint(greaterThanOrEqualTo: topDivider.bottomAnchor, constant: 20),
            valueDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            valueDescriptionLabel.bottomAnchor.constraint(greaterThanOrEqualTo: bottomDivider.topAnchor, constant: -20),
            valueDescriptionLabel.trailingAnchor.constraint(equalTo: valueLabel.leadingAnchor, constant: -8),
            valueDescriptionLabel.centerYAnchor.constraint(equalTo: valueLabel.centerYAnchor)
        ]

        NSLayoutConstraint.activate(contraints)
    }
}
