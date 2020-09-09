import UIKit
import NatDS

final class ChooseBrandCell: UITableViewCell {

    // MARK: - Private properties

    private let brandImageView: UIImageView = {
        let imageView = UIImageView()
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

    }

    // MARK: - Private methods

    private func setup() {
        backgroundColor = .black

        contentView.addSubview(brandImageView)

        NSLayoutConstraint.activate([
//            label.topAnchor.constraint(
//                equalTo: contentView.topAnchor,
//                constant: NatSpacing.micro
//            ),
//            label.leftAnchor.constraint(
//                equalTo: contentView.leftAnchor
//            ),
//
//            symbolicView.topAnchor.constraint(
//                greaterThanOrEqualTo: label.bottomAnchor,
//                constant: NatSpacing.micro
//            ),
//            symbolicView.bottomAnchor.constraint(
//                lessThanOrEqualTo: contentView.bottomAnchor,
//                constant: -NatSpacing.small
//            ),
//            symbolicView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            symbolicSizeHeightConstraint,
//            symbolicSizeWidthConstraint
        ])
    }
}
