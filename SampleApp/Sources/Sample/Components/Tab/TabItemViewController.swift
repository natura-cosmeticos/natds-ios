import UIKit
import NatDS

class TabItemViewController: UIViewController, SampleItem {
    static var name: String = "Tab"

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.spacing = 80
        return stackView
    }()
    private let scrollableTab = Tab()
    private let fixedTab = Tab()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        title = Self.name
        view.backgroundColor = .white
        addStackView()

        // Fixed
        addTab(tab: fixedTab)
        fixedTab.delegate = self
        fixedTab.insertTab(title: "AVON")
        fixedTab.insertTab(title: "THE BODY SHOP")
        fixedTab.insertTab(title: "AĒSOP")
        fixedTab.configure(position: .fixed)
        // fixedTab.selectedSegmentedIndex = 1

        // Scrollable
        addTab(tab: scrollableTab)
        scrollableTab.delegate = self
        scrollableTab.insertTab(title: "AVON")
        scrollableTab.insertTab(title: "THE BODY SHOP")
        scrollableTab.insertTab(title: "AĒSOP")
        scrollableTab.insertTab(title: "NATURA")
        scrollableTab.insertTab(title: "NATURA&CO")
        scrollableTab.configure(position: .scrollable)
        //scrollableTab.selectedSegmentedIndex = 1
    }
    private func addStackView() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    private func addTab(tab: Tab) {
        stackView.addArrangedSubview(tab)
        tab.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tab.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            tab.trailingAnchor.constraint(equalTo: stackView.trailingAnchor)
        ])
    }
}

extension TabItemViewController: TabDelegate {

    func didChangeSelectedSegmented(index: Int) {
        print("selected index: \(index)")
    }
}
