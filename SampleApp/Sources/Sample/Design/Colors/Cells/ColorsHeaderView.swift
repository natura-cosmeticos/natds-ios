import UIKit
import NatDS

final class ColorsHeader: UITableViewHeaderFooterView {
    private let sectionLabel: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .subtitle1, withWeight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        setup()
    }

    func configure(section: String) {
        sectionLabel.text = section
    }

    func setup() {
        contentView.backgroundColor = NatColors.background
        contentView.addSubview(sectionLabel)

        NSLayoutConstraint.activate([
            sectionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: NatSpacing.tiny),
            sectionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -NatSpacing.tiny),
            sectionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -NatSpacing.tiny),
            sectionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: NatSpacing.tiny)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ColorsHeader: ReusableView {}
