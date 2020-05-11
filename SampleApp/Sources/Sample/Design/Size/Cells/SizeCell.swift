import UIKit
import NatDS

final class SizeCell: UITableViewCell {

    // MARK: - Private properties

    private let label: UILabel = {
        let label = UILabel()
        label.font = Fonts.body1
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let symbolicView: UIView = {
        let view = UIView()
        view.backgroundColor = NatColors.primary
        view.layer.cornerRadius = NatBorderRadius.medium
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private var symbolicSizeHeightConstraint: NSLayoutConstraint!
    private var symbolicSizeWidthConstraint: NSLayoutConstraint!

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

    func configure(description: String, size: CGFloat) {
        label.text = description

        symbolicSizeHeightConstraint.constant = size
        symbolicSizeWidthConstraint.constant = size
        symbolicView.layoutIfNeeded()
    }

    // MARK: - Private methods

    private func setup() {
        contentView.addSubview(label)
        contentView.addSubview(symbolicView)

        symbolicSizeHeightConstraint = symbolicView
            .heightAnchor.constraint(equalToConstant: 0)
        symbolicSizeWidthConstraint = symbolicView
            .widthAnchor.constraint(equalToConstant: 0)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: NatSpacing.micro
            ),
            label.leftAnchor.constraint(
                equalTo: contentView.leftAnchor
            ),

            symbolicView.topAnchor.constraint(
                equalTo: label.bottomAnchor,
                constant: NatSpacing.micro
            ),
            symbolicView.bottomAnchor.constraint(
                lessThanOrEqualTo: contentView.bottomAnchor,
                constant: -NatSpacing.micro
            ),
            symbolicView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            symbolicView.leftAnchor.constraint(
//                equalTo: contentView.leftAnchor
//            ),
            symbolicSizeHeightConstraint,
            symbolicSizeWidthConstraint
        ])
    }
}
