import UIKit
import NatDS

class ValueTextHighlightViewController: UIViewController {

    private let valueTextHighlight = ValueTextHighlight()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        title = "Value Text Highlight"
    }

    private func setup() {
        view.backgroundColor = .white

        let backButton = UIBarButtonItem()
        backButton.title = "Sample App"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton

        addValueTextHighlight()

        valueTextHighlight.valueDescription = "Amout value"
        valueTextHighlight.value = "$40,00"
    }

    private func addValueTextHighlight() {
        view.addSubview(valueTextHighlight)
        valueTextHighlight.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            valueTextHighlight.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            valueTextHighlight.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            valueTextHighlight.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
