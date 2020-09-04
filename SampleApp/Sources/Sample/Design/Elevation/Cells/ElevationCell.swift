import UIKit
import NatDS

final class ElevationCell: UITableViewCell {

    // MARK: - Private properties

    private let label: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .body1, withWeight: .regular)
        label.textColor = NatColors.mediumEmphasis
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let symbolicView: UIView = {
        let view = UIView()
        view.backgroundColor = NatColors.surface
        view.layer.cornerRadius = NatBorderRadius.medium
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
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

    // MARK: - Overrides

    override func prepareForReuse() {
        symbolicView.layer.shadowColor = nil
        symbolicView.layer.shadowOffset = .init(width: 0, height: -3)
        symbolicView.layer.shadowRadius = 3
        symbolicView.layer.shadowOpacity = 0
    }

    // MARK: - Public methods

    func configure(description: String, elevation: NatElevation.Elevation) {
        label.text = description

        NatElevation.apply(on: symbolicView, elevation: elevation)
    }
    // MARK: - Private methods

    private func setup() {
        backgroundColor = NatColors.background

        contentView.addSubview(label)
        contentView.addSubview(symbolicView)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: NatSpacing.micro),
            label.leftAnchor.constraint(equalTo: contentView.leftAnchor),

            symbolicView.topAnchor.constraint(
                equalTo: label.bottomAnchor,
                constant: NatSpacing.micro
            ),
            symbolicView.widthAnchor.constraint(equalToConstant: NatSizes.huge),
            symbolicView.heightAnchor.constraint(equalToConstant: NatSizes.huge),
            symbolicView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}
