import UIKit
import NatDS

final class SizeCell: UITableViewCell {

    // MARK: - Private properties

    private let symbolicSizeView: UIView = {
        let view = UIView()
        view.backgroundColor = DSColors.primary
        view.layer.cornerRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.font = Fonts.body1
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

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

        symbolicSizeWidthConstraint.constant = size
        symbolicSizeView.layoutIfNeeded()
    }

    // MARK: - Private methods

    private func setup() {
        contentView.addSubview(symbolicSizeView)
        contentView.addSubview(label)

        symbolicSizeWidthConstraint = symbolicSizeView
            .widthAnchor.constraint(equalToConstant: 0)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 4
            ),
            label.leftAnchor.constraint(
                equalTo: contentView.leftAnchor
            ),

            symbolicSizeView.topAnchor.constraint(
                equalTo: label.bottomAnchor,
                constant: 4
            ),
            symbolicSizeView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -4
            ),
            symbolicSizeView.leftAnchor.constraint(
                equalTo: contentView.leftAnchor
            ),
            symbolicSizeWidthConstraint
        ])
    }
}
