import UIKit
import NatDS

class DividerViewController: UIViewController, SampleItem {
    static var name: String = "Divider"

    private let dividerFullBleed: Divider = {
        let divider = Divider()
        divider.configure(style: .fullBleed)
        divider.translatesAutoresizingMaskIntoConstraints = false

        return divider
    }()

    private let dividerMiddle: Divider = {
        let divider = Divider()
        divider.configure(style: .middle)
        divider.translatesAutoresizingMaskIntoConstraints = false

        return divider
    }()

    private let dividerInset: Divider = {
        let divider = Divider()
        divider.configure(style: .inset)
        divider.translatesAutoresizingMaskIntoConstraints = false

        return divider
    }()

    private let labelFullBleed: UILabel = {
        let label = UILabel()
        label.text = " Full-bleed"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let labelMiddle: UILabel = {
        let label = UILabel()
        label.text = " Middle"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let labelInset: UILabel = {
        let label = UILabel()
        label.text = " Inset"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = NatSpacing.large
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        title = Self.name
        view.backgroundColor = .white

        addDividers()
    }

    private func addDividers() {
        view.addSubview(stackView)

        stackView.addArrangedSubview(labelFullBleed)
        stackView.addArrangedSubview(dividerFullBleed)

        stackView.addArrangedSubview(labelMiddle)
        stackView.addArrangedSubview(dividerMiddle)

        stackView.addArrangedSubview(labelInset)
        stackView.addArrangedSubview(dividerInset)

        let constraints = [
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ]

        NSLayoutConstraint.activate(constraints)
    }
}
