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

        tab.insertTab(title: "Tab 1")
        tab.insertTab(title: "Tab 2")
        tab.insertTab(title: "Tab 3")

        tab.selectedIndex = 2
    }

    private func addTab() {
        view.addSubview(tab)
        tab.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            tab.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tab.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tab.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tab.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tab.heightAnchor.constraint(greaterThanOrEqualToConstant: 48)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
