import UIKit
import NatDS

class CounterViewController: UIViewController, SampleItem {
    static var name: String = "Counter"

    let counter = NatCounter(size: .semi)

    override func viewDidLoad() {
        title = Self.name
        view.backgroundColor = NatColors.background

        counter.configure(label: "Label example")
        counter.configure(disableSubtractButton: true)
        setup()
    }

    private func setup() {
        view.addSubview(counter)
        counter.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            counter.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            counter.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
