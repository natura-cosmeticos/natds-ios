import UIKit
import NatDS

final class TipographyCell: UITableViewCell {

    // MARK: - Private properties

    private let sizeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let weightLabel: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .caption, withWeight: .regular)
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

    func configure(viewModel: ViewModel) {
        sizeLabel.text = viewModel.sizeDescription
        sizeLabel.font = viewModel.font
        weightLabel.text = viewModel.weightDescription
    }

    // MARK: - Private methods

    private func setup() {
        contentView.addSubview(sizeLabel)
        contentView.addSubview(weightLabel)

        NSLayoutConstraint.activate([
            sizeLabel.topAnchor.constraint(
                greaterThanOrEqualTo: contentView.topAnchor,
                constant: DSSpacing.micro
            ),
            sizeLabel.rightAnchor.constraint(
                lessThanOrEqualTo: weightLabel.leftAnchor
            ),
            sizeLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -DSSpacing.micro
            ),
            sizeLabel.leftAnchor.constraint(
                equalTo: contentView.leftAnchor
            ),
            weightLabel.topAnchor.constraint(
                greaterThanOrEqualTo: contentView.topAnchor,
                constant: DSSpacing.micro
            ),
            weightLabel.rightAnchor.constraint(
                equalTo: contentView.rightAnchor
            ),
            weightLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -DSSpacing.micro
            )
        ])
    }
}

extension TipographyCell {
    struct ViewModel {
        let sizeDescription: String
        let weightDescription: String
        let font: UIFont
    }
}
