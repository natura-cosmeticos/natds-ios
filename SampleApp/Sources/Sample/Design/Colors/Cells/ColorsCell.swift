import UIKit
import NatDS

final class ColorsCell: UITableViewCell {
    typealias ViewModel = (colorName: String, color: UIColor, onColor: UIColor, isTextOnHidden: Bool)

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.h5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let hexLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.body2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(viewModel: ViewModel) {
        nameLabel.text = viewModel.colorName
        nameLabel.textColor = viewModel.onColor

        hexLabel.text = createTextForHexLabel(viewModel: viewModel)
        hexLabel.textColor = viewModel.onColor

        backgroundColor = viewModel.color
    }

    private func createTextForHexLabel(viewModel: ViewModel) -> String {
        var text = viewModel.color.hex

        if !viewModel.isTextOnHidden {
            text += " / ON: \(viewModel.onColor.hex)"
        }

        return text
    }

    func setup() {
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(hexLabel)

        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8)
        ])
    }
}

private extension UIColor {
    var hex: String {
        let components = cgColor.components
        let red: CGFloat = components?[0] ?? 0.0
        let green: CGFloat = components?[1] ?? 0.0
        let blue: CGFloat = components?[2] ?? 0.0

        let hexString = String.init(format: "#%02lX%02lX%02lX",
                                    lroundf(Float(red * 255)),
                                    lroundf(Float(green * 255)),
                                    lroundf(Float(blue * 255)))
        return hexString
    }
}
