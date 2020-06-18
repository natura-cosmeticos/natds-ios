import UIKit

public class ExpansionPanel: UIView {

    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = Fonts.subtitle1
        label.textColor = Colors.Content.highEmphasis
        return label
    }()

    init() {
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
        addSubviews()
        setLayout()
    }

    private func addSubviews() {
        addSubview(subtitleLabel)
    }

    private func setLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 64)
        ])
        setSubtitleLabelLayout()
    }

    private func setSubtitleLabelLayout() {
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            subtitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 21),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }

}
