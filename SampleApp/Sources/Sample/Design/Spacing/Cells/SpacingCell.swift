import UIKit
import NatDS

final class SpacingCell: UITableViewCell {

    // MARK: - Private properties

    private let symbolicSpacingView: UIView = {
        let view = UIView()
        view.backgroundColor = DSColors.primary
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private var symbolicSpacingHeightConstraint: NSLayoutConstraint!

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

    func configure(description: String, spacing: CGFloat) {
        label.text = description

        symbolicSpacingHeightConstraint.constant = spacing
        symbolicSpacingView.layoutIfNeeded()
    }

    // MARK: - Private methods

    private func setup() {
        contentView.addSubview(symbolicSpacingView)
        contentView.addSubview(label)

        symbolicSpacingHeightConstraint = symbolicSpacingView
            .heightAnchor.constraint(equalToConstant: 0)
        symbolicSpacingHeightConstraint.priority = .defaultLow

        NSLayoutConstraint.activate([
            symbolicSpacingView.topAnchor.constraint(
                greaterThanOrEqualTo: contentView.topAnchor,
                constant: 4
            ),
            symbolicSpacingView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -4
            ),
            symbolicSpacingView.leftAnchor.constraint(
                equalTo: contentView.leftAnchor
            ),
            symbolicSpacingHeightConstraint,
            symbolicSpacingView.widthAnchor.constraint(
                equalTo: contentView.widthAnchor,
                multiplier: 0.65
            ),

            label.topAnchor.constraint(
                greaterThanOrEqualTo: contentView.topAnchor,
                constant: 4
            ),
            label.rightAnchor.constraint(
                equalTo: contentView.rightAnchor
            ),
            label.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -4
            )
        ])
    }
}
