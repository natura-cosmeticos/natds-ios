import UIKit
import NatDS

class TabItemViewController: UIViewController, SampleItem {
    static var name: String = "Tab"

    private let tab = Tab()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        title = Self.name
        view.backgroundColor = .white

        addTab()

        tab.delegate = self

        for index in 1...3 {
            tab.insertTab(title: "Tab \(index)")
        }

        tab.selectedSegmentedIndex = 2
    }

    private func addTab() {
        view.addSubview(tab)
        tab.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            tab.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tab.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tab.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tab.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tab.heightAnchor.constraint(greaterThanOrEqualToConstant: 48)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}

extension TabItemViewController: TabDelegate {

    func didChangeSelectedSegmented(index: Int) {
        print("selected index: \(index)")
    }
}
