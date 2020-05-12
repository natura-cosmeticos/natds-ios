import UIKit
import NatDS

// swiftlint:disable function_body_length

final class SpacingCell: UITableViewCell {

    // MARK: - Private properties

    private let label: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .body1, withWeight: .regular)
        label.textColor = NatColors.mediumEmphasis
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let symbolicViewTopLeft: UIView = {
        let view = UIView()
        view.backgroundColor = NatColors.primary
        view.layer.cornerRadius = NatBorderRadius.small
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let symbolicViewTopRight: UIView = {
        let view = UIView()
        view.backgroundColor = NatColors.primary
        view.layer.cornerRadius = NatBorderRadius.small
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let symbolicViewBottomRight: UIView = {
        let view = UIView()
        view.backgroundColor = NatColors.primary
        view.layer.cornerRadius = NatBorderRadius.small
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let symbolicViewBottomLeft: UIView = {
        let view = UIView()
        view.backgroundColor = NatColors.primary
        view.layer.cornerRadius = NatBorderRadius.small
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private var topLeftCenterConstraint: NSLayoutConstraint!
    private var bottomLeftCenterConstraint: NSLayoutConstraint!

    private var topLeftFromTopRightConstraint: NSLayoutConstraint!
    private var topRightFromBottomRightConstraint: NSLayoutConstraint!
    private var bottomRightFromBottomLeftConstraint: NSLayoutConstraint!
    private var bottomLeftFromTopLeftConstraint: NSLayoutConstraint!

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

        topLeftCenterConstraint.constant = (-spacing - NatSpacing.semi) / 2
        bottomLeftCenterConstraint.constant = (-spacing - NatSpacing.semi) / 2

        topLeftFromTopRightConstraint.constant = -spacing
        topRightFromBottomRightConstraint.constant = -spacing
        bottomRightFromBottomLeftConstraint.constant = spacing
        bottomLeftFromTopLeftConstraint.constant = spacing
    }

    // MARK: - Private methods

    private func setup() {
        contentView.addSubview(symbolicViewTopLeft)
        contentView.addSubview(symbolicViewTopRight)
        contentView.addSubview(symbolicViewBottomRight)
        contentView.addSubview(symbolicViewBottomLeft)
        contentView.addSubview(label)

        topLeftCenterConstraint = symbolicViewTopLeft.centerXAnchor.constraint(
            equalTo: contentView.centerXAnchor
        )
        bottomLeftCenterConstraint = symbolicViewBottomLeft.centerXAnchor.constraint(
            equalTo: contentView.centerXAnchor
        )

        topLeftFromTopRightConstraint = symbolicViewTopLeft.rightAnchor.constraint(
            equalTo: symbolicViewTopRight.leftAnchor
        )

        topRightFromBottomRightConstraint = symbolicViewTopRight.bottomAnchor.constraint(
            equalTo: symbolicViewBottomRight.topAnchor
        )

        bottomRightFromBottomLeftConstraint = symbolicViewBottomRight.leftAnchor.constraint(
            equalTo: symbolicViewBottomLeft.rightAnchor
        )

        bottomLeftFromTopLeftConstraint = symbolicViewBottomLeft.topAnchor.constraint(
            equalTo: symbolicViewTopLeft.bottomAnchor
        )
        bottomLeftFromTopLeftConstraint.priority = .defaultLow

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(
                greaterThanOrEqualTo: contentView.topAnchor,
                constant: NatSpacing.micro
            ),
            label.leftAnchor.constraint(
                equalTo: contentView.leftAnchor
            ),

            symbolicViewTopLeft.topAnchor.constraint(
                equalTo: label.bottomAnchor,
                constant: NatSpacing.micro
            ),
            symbolicViewTopLeft.heightAnchor.constraint(equalToConstant: NatSizes.medium),
            symbolicViewTopLeft.widthAnchor.constraint(equalToConstant: NatSizes.medium),
            topLeftCenterConstraint,

            topLeftFromTopRightConstraint,

            symbolicViewTopRight.topAnchor.constraint(
                equalTo: label.bottomAnchor,
                constant: NatSpacing.micro
            ),
            symbolicViewTopRight.heightAnchor.constraint(equalToConstant: NatSizes.medium),
            symbolicViewTopRight.widthAnchor.constraint(equalToConstant: NatSizes.medium),

            topRightFromBottomRightConstraint,

            symbolicViewBottomRight.heightAnchor.constraint(equalToConstant: NatSizes.medium),
            symbolicViewBottomRight.widthAnchor.constraint(equalToConstant: NatSizes.medium),

            bottomRightFromBottomLeftConstraint,

            symbolicViewBottomLeft.heightAnchor.constraint(equalToConstant: NatSizes.medium),
            symbolicViewBottomLeft.widthAnchor.constraint(equalToConstant: NatSizes.medium),
            bottomLeftCenterConstraint,

            bottomLeftFromTopLeftConstraint,

            symbolicViewBottomLeft.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -NatSpacing.small
            )
        ])
    }
}
