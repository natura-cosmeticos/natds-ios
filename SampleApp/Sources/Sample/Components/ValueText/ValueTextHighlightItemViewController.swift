import UIKit
import NatDS

class ValueTextHighlightItemViewController: UIViewController, SampleItem {

    static var name: String = "Value Text Highlight"

    private let valueTextHighlight = ValueTextHighlight()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        title = Self.name
        view.backgroundColor = .white

        addValueTextHighlight()

        valueTextHighlight.valueDescription = "Amount value"
        valueTextHighlight.value = "$40,00"
    }

    private func addValueTextHighlight() {
        view.addSubview(valueTextHighlight)
        valueTextHighlight.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            valueTextHighlight.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            valueTextHighlight.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            valueTextHighlight.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            valueTextHighlight.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
