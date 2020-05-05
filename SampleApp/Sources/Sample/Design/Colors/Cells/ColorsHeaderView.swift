import UIKit
import NatDS

final class ColorsHeader: UITableViewHeaderFooterView {
    private let sectionLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.subtitle1
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
        contentView.backgroundColor = DSColors.background
        contentView.addSubview(sectionLabel)

        NSLayoutConstraint.activate([
            sectionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            sectionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
            sectionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            sectionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ColorsHeader: ReusableView {}
