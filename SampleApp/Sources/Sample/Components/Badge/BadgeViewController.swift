import UIKit
import NatDS

class BadgeViewController: UIViewController, SampleItem {
    static var name: String = "Badge"

    private lazy var oneCharStandard: NatBadge = {
        let standard = NatBadge(style: .standard, color: .alert)
        standard.configure(count: 9)
        return standard
    }()

    private lazy var twoCharStandard: NatBadge = {
        let standard = NatBadge(style: .standard, color: .alert)
        standard.configure(count: 99)
        return standard
    }()

    private lazy var threeCharStandard: NatBadge = {
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

        view.addSubview(oneCharStandard)
        view.addSubview(twoCharStandard)
        view.addSubview(threeCharStandard)

        let constraints = [
            oneCharStandard.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            oneCharStandard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
            twoCharStandard.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            twoCharStandard.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            threeCharStandard.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            threeCharStandard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
