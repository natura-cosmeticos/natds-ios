import NatDS
import UIKit

class ProgressIndicatorItemViewController: UIViewController, SampleItem {
    static var name = "Progress Indicator"
    private let progressIndicator = NatProgressIndicatorCircular()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Self.name
        view.backgroundColor = .white
        addProgressIndicator()
        progressIndicator.configure(state: .showAndStartAnimation)
    }

    private func addProgressIndicator() {
        view.addSubview(progressIndicator)

        progressIndicator.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            progressIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)

        ])
    }
}
