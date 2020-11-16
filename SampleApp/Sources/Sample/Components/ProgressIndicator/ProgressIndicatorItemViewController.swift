import NatDS
import UIKit

class ProgressIndicatorItemViewController: UIViewController, SampleItem {
    static var name = "Progress Indicator"
    var progressIndicator = ProgressIndicatorCircular()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Self.name
        setup()
        view.backgroundColor = .white

    }

    private func setup() {
        addProgressIndicator()
    }

    private func addProgressIndicator() {
        view.addSubview(progressIndicator)
        progressIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            progressIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            progressIndicator.heightAnchor.constraint(equalToConstant: 100),
            progressIndicator.widthAnchor.constraint(equalToConstant: 100)
        ])
    }

}
