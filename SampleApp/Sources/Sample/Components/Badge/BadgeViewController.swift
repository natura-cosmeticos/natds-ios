import UIKit
import NatDS

class BadgeViewController: UIViewController, SampleItem {
    static var name: String = "Badge"

    private lazy var standard: NatBadge = {
        let standard = NatBadge(style: .standard, color: .alert)
        standard.text = "99+"
        standard.translatesAutoresizingMaskIntoConstraints = false
        return standard
    }()

    private lazy var square: UIView = {
        let square = UIView()
        square.translatesAutoresizingMaskIntoConstraints = false
        square.backgroundColor = NatColors.primary
        return square
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        title = Self.name
        view.backgroundColor = .white
        square.addSubview(standard)
        view.addSubview(square)

        let constraints = [
            square.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            square.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            square.widthAnchor.constraint(equalToConstant: 50),
            square.heightAnchor.constraint(equalToConstant: 50),
            standard.topAnchor.constraint(equalTo: square.topAnchor),
            standard.rightAnchor.constraint(equalTo: square.rightAnchor),
            standard.bottomAnchor.constraint(equalTo: square.bottomAnchor),
            standard.leftAnchor.constraint(equalTo: square.leftAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
