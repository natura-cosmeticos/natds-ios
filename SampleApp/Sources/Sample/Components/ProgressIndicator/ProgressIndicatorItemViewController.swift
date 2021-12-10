import NatDS
import UIKit

class ProgressIndicatorItemViewController: UIViewController, SampleItem {
    static var name = "Progress Indicator"
    private let progressIndicator = NatProgressIndicatorCircular(size: .medium)

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Self.name
        view.backgroundColor = NatColors.background
        addProgressIndicator()
        setupProgressIndicator()
    }

    private func addProgressIndicator() {
        view.addSubview(progressIndicator)
        progressIndicator.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            progressIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    private func setupProgressIndicator() {
        progressIndicator.configure(useBackgroundLayer: true)
    }
}
