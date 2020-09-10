import UIKit
import NatDS

final class ChooseBrandCell: UITableViewCell {

    // MARK: - Private properties

    private let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let brandImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    // MARK: - Inits

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods

    func configure(imageName: String) {
        brandImageView.image = UIImage(named: imageName)
    }

    // MARK: - Private methods

    private func setup() {
        backgroundColor = .blue

        contentView.addSubview(cardView)
        cardView.addSubview(brandImageView)

        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),

            brandImageView.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            brandImageView.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),

//            brandImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10),
//            brandImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10),
//            brandImageView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -10),
//            brandImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10)
        ])
    }
}
