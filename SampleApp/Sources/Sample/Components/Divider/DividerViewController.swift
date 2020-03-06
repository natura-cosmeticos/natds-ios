import UIKit
import NatDS

class DividerViewController: UIViewController, SampleItem {

    static var name: String = "Divider"

    private let divider = Divider()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        title = Self.name
        view.backgroundColor = .white

        addDivider()
    }

    private func addDivider() {
        view.addSubview(divider)
        divider.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            divider.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            divider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            divider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            divider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
