import UIKit
import NatDS

class BadgeViewController: UIViewController, SampleItem {
    static var name: String = "Badge"

    private lazy var standard: NatBadge = {
        let standard = NatBadge(style: .standard, color: .alert)
        standard.configure(count: 100)
        return standard
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        title = Self.name
        view.backgroundColor = NatColors.background
        view.addSubview(standard)

        let constraints = [
            standard.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            standard.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
