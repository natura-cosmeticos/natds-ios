import Foundation

/**
 ValueTextHighlight is a class that represents  a component from the design system.

    Example of usage:
    - valueTextHighlight.valueDescription = "Amount value"
    - valueTextHighlight.value = "$40,00"

 - Requires:
        It's necessary to configure the Design System with a theme or fatalError will be raised.

            DesignSystem().configure(with: AvailableTheme)
*/

public class ValueTextHighlight: UIView {

    public var valueDescription: String? {
        get { return valueDescriptionLabel.text }
        set { valueDescriptionLabel.text = newValue }
    }

    public var value: String? {
        get { return valueLabel.text }
        set { valueLabel.text = newValue }
    }

    private lazy var topDivider: Divider = {
        return Divider()
    }()

    private lazy var bottomDivider: Divider = {
        return Divider()
    }()

    private lazy var valueDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .body2)
        label.textColor = NatColors.mediumEmphasis
        label.textAlignment = .left

        return label
    }()

    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .heading5)
        label.textColor = NatColors.highlight
        label.textAlignment = .right

        return label
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

        let constraints = [
            topDivider.topAnchor.constraint(equalTo: topAnchor),
            topDivider.leadingAnchor.constraint(equalTo: leadingAnchor),
            topDivider.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    private func addBottomDivider() {
        self.addSubview(bottomDivider)
        bottomDivider.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            bottomDivider.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomDivider.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomDivider.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    private func addValueLabel() {
        self.addSubview(valueLabel)
        valueLabel.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            valueLabel.topAnchor.constraint(equalTo: topDivider.bottomAnchor, constant: 20),
            valueLabel.bottomAnchor.constraint(equalTo: bottomDivider.topAnchor, constant: -20),
            valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    private func addValueDescriptionLabel() {
        self.addSubview(valueDescriptionLabel)
        valueDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            valueDescriptionLabel.topAnchor.constraint(greaterThanOrEqualTo: topDivider.bottomAnchor, constant: 20),
            valueDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            valueDescriptionLabel.bottomAnchor.constraint(greaterThanOrEqualTo: bottomDivider.topAnchor, constant: -20),
            valueDescriptionLabel.trailingAnchor.constraint(equalTo: valueLabel.leadingAnchor, constant: -8),
            valueDescriptionLabel.centerYAnchor.constraint(equalTo: valueLabel.centerYAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
