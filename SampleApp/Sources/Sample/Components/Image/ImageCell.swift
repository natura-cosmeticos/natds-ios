import UIKit
import NatDS

final class ImageCell: UITableViewCell {
    typealias ViewModel = (description: String,
                           variant: NatImage.ImageType,
                           radius: NatImage.ImageRadius,
                           fade: NatImage.ImageFadeDirection?)

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .body1, withWeight: .regular)
        label.textColor = NatColors.onBackground
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var natImageView: NatImage = {
        let view = NatImage()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = 12
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
        nameLabel.text = viewModel.description

        natImageView.configure(variant: viewModel.variant)
        natImageView.configureRadius(viewModel.radius)
        natImageView.configure(setImage: UIImage(named: "ImageAreaPlaceholder"))
        natImageView.configure(contentMode: .scaleAspectFill)
        if let fade = viewModel.fade {
            natImageView.configureFade(fade)
        } else {
            natImageView.configureFade(.none)
        }

        setNeedsDisplay()
    }

    private func setup() {
        backgroundColor = NatColors.background
        stackView.addArrangedSubview(natImageView)
        stackView.addArrangedSubview(nameLabel)

        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),

            natImageView.heightAnchor.constraint(equalToConstant: 80),
            natImageView.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
}
