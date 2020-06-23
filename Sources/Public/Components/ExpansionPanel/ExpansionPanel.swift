import UIKit

public class ExpansionPanel: UIView {

    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = Fonts.subtitle1
        label.textColor = Colors.Content.highEmphasis
        return label
    }()

    private lazy var upDownButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = Colors.Content.highEmphasis
        button.titleLabel?.font = .iconFont(ofSize: 18.0)
        button.setTitle(Icon.outlinedNavigationArrowbottom.unicode, for: .normal)
        button.layer.cornerRadius = 9.0
        button.addTarget(self, action: #selector(didTapUpDownButton), for: .touchUpInside)
        return button
    }()

    private let viewAnimating: ViewAnimating

    public init() {
        self.viewAnimating = ViewAnimatingWrapper()
        super.init(frame: .zero)
        setup()
    }

    init(viewAnimating: ViewAnimating) {
        self.viewAnimating = viewAnimating
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setSubtitle(_ subtitle: String) {
        subtitleLabel.text = subtitle
    }

    private func setup() {
        backgroundColor = Colors.Surface.surface
        NatElevation.apply(on: self, elevation: .elevation01)
        layer.cornerRadius = NatBorderRadius.medium
        addSubviews()
        setLayout()
    }

    private func addSubviews() {
        addSubview(subtitleLabel)
        addSubview(upDownButton)
    }

    private func setLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 64)
        ])
        setSubtitleLabelLayout()
        setUpDownButtonLayout()
    }

    private func setSubtitleLabelLayout() {
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            subtitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 21),
            subtitleLabel.trailingAnchor.constraint(equalTo: upDownButton.leadingAnchor, constant: -16)
        ])
    }

    private func setUpDownButtonLayout() {
        upDownButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            upDownButton.widthAnchor.constraint(equalToConstant: 18),
            upDownButton.heightAnchor.constraint(equalToConstant: 18),
            upDownButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            upDownButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }

    @objc private func didTapUpDownButton() {
        if upDownButton.transform == CGAffineTransform.identity {
            rotateButtonUp()
        } else {
            rotateButtonDown()
        }
    }

    private func rotateButtonUp() {
        viewAnimating.animate(withDuration: 0.7) {
            self.upDownButton.transform = CGAffineTransform(rotationAngle: .pi)
        }
    }

    private func rotateButtonDown() {
        viewAnimating.animate(withDuration: 0.7, animations: {
            self.upDownButton.transform = CGAffineTransform(rotationAngle: .pi * -2.0)
        }, completion: { (_) in
            self.upDownButton.transform = CGAffineTransform.identity
        })
    }

}
