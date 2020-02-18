import UIKit
import NatDS

class ColorHeaderCollectionViewCell: UICollectionViewCell {

    var name: String? {
        didSet {
            sectionLabel.text = name
        }
    }

    private let sectionLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        sectionLabel.font = Fonts.h6
        addSubview(sectionLabel)
        sectionLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            sectionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            sectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            sectionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8),
            sectionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
