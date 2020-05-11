import UIKit
import NatDS

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
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let symbolicViewTopRight: UIView = {
        let view = UIView()
        view.backgroundColor = NatColors.primary
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let symbolicViewBottomRight: UIView = {
        let view = UIView()
        view.backgroundColor = NatColors.primary
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let symbolicBottomLeft: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

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

//        symbolicSpacingHeightConstraint.constant = spacing

        bottomLeftFromTopLeftConstraint.constant = spacing
//        bottomLeftFromTopLeftConstraint.layoutIfNeeded()
    }

    // MARK: - Private methods

    private func setup() {
        contentView.addSubview(symbolicViewTopLeft)
//        contentView.addSubview(symbolicViewTopRight)
//        contentView.addSubview(symbolicViewBottomRight)
        contentView.addSubview(symbolicBottomLeft)
        contentView.addSubview(label)

//        symbolicSpacingHeightConstraint = symbolicSpacingView
//            .heightAnchor.constraint(equalToConstant: 0)
//        symbolicSpacingHeightConstraint.priority = .defaultLow

        bottomLeftFromTopLeftConstraint = symbolicBottomLeft.topAnchor.constraint(equalTo: symbolicViewTopLeft.bottomAnchor)
        NSLayoutConstraint.activate([
//            symbolicSpacingView.topAnchor.constraint(
//                greaterThanOrEqualTo: contentView.topAnchor,
//                constant: NatSpacing.micro
//            ),
//            symbolicSpacingView.bottomAnchor.constraint(
//                equalTo: contentView.bottomAnchor,
//                constant: -NatSpacing.micro
//            ),
//            symbolicSpacingView.leftAnchor.constraint(
//                equalTo: contentView.leftAnchor
//            ),
//            symbolicSpacingHeightConstraint,
//            symbolicSpacingView.widthAnchor.constraint(
//                equalTo: contentView.widthAnchor,
//                multiplier: 0.62
//            ),

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
            symbolicViewTopLeft.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -NatSpacing.standart),
//            symbolicViewTopLeft.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

//            symbolicViewTopRight.heightAnchor.constraint(equalToConstant: NatSizes.medium),
//            symbolicViewTopRight.widthAnchor.constraint(equalToConstant: NatSizes.medium),
//            symbolicViewTopRight.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            symbolicViewTopRight.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//
//            symbolicViewBottomRight.heightAnchor.constraint(equalToConstant: NatSizes.medium),
//            symbolicViewBottomRight.widthAnchor.constraint(equalToConstant: NatSizes.medium),
//            symbolicViewBottomRight.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            symbolicViewBottomRight.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//
            symbolicBottomLeft.heightAnchor.constraint(equalToConstant: NatSizes.medium),
            symbolicBottomLeft.widthAnchor.constraint(equalToConstant: NatSizes.medium),
            symbolicBottomLeft.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -NatSpacing.standart),
//            symbolicBottomLeft.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            bottomLeftFromTopLeftConstraint,
            symbolicBottomLeft.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -NatSpacing.small)
        ])
    }
}
