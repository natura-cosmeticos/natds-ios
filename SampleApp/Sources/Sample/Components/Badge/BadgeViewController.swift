import UIKit
import NatDS

class BadgeViewController: UIViewController, SampleItem {
    static var name: String = "Badge"

    private lazy var dotExample: NatBadge = {
        let standard = NatBadge(style: .dot, color: .alert)
        standard.configureDot()
        return standard
    }()

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

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = NatSpacing.large
        stackView.distribution = .fillProportionally
        stackView.alignment = .top
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        title = Self.name
        view.backgroundColor = NatColors.background

        view.addSubview(stackView)
        stackView.addArrangedSubview(dotExample)
        stackView.addArrangedSubview(oneCharStandard)
        stackView.addArrangedSubview(twoCharStandard)
        stackView.addArrangedSubview(threeCharStandard)

        let constraints = [
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 12)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
