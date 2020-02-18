import Foundation

public class Tab: UIView {

    public var selectedIndex: Int = 0 {
        didSet {
            handleIndexChange()
        }
    }

    private var tabs: [TabItemView] = []

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal

        return stackView
    }()

    init() {
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Tab {
    private func setup() {
        backgroundColor = .clear
        addStackView()
        handleIndexChange()
    }

    private func addStackView() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}

extension Tab {
    public func insertTabs(tabs: [TabItem]) {

        let views = tabs.enumerated().map { (index, tab) -> TabItemView in
            let tabView = TabItemView(index: index, title: tab.title)
            tabView.delegate = self
            stackView.addArrangedSubview(tabView)

            return tabView
        }

        self.tabs = views
        self.selectedIndex = 0
    }
}

extension Tab {

    func handleIndexChange() {
        for tab in tabs {
            tab.changeToIndex(selectedIndex: selectedIndex)
        }
    }
}

extension Tab: TabItemViewDelegate {

    func didTapTabItemAt(index: Int) {
        selectedIndex = index
    }
}

public struct TabItem {
    var title: String
}
