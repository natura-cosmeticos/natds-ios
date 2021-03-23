import UIKit
import NatDS

class CounterViewController: UIViewController, SampleItem {
    static var name: String = "Counter"

    let counter = NatCounter()

    override func viewDidLoad() {
        title = Self.name
        view.backgroundColor = NatColors.background

        setup()
    }

    private func setup() {
        view.addSubview(counter)
        counter.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            counter.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            counter.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//            counter.heightAnchor.constraint(equalToConstant: 200),
//            counter.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}
