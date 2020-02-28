import Foundation

public protocol TabDelegate: AnyObject {
    func didChangeSelectedSegmented(index: Int)
}

public class Tab: UIView {

    public weak var delegate: TabDelegate?

    public var selectedSegmentedIndex: Int {
        get { selectedIndex }
        set {
            if (0..<tabs.count).contains(newValue) {
                selectedIndex = newValue
            }
        }
    }

    private(set) var tabs: [TabItemView] = []

    private var selectedIndex: Int = 0 {
        didSet {
            handleIndexChange()
        }
    }

    private lazy var indicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.secondary
        return view
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        return stackView
    }()

    private var indicatorViewWidthConstraint: NSLayoutConstraint?
    private var indicatorViewLeadingConstraint: NSLayoutConstraint?

    public init() {
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public extension Tab {

    func insertTab(title: String) {
        let tabView = TabItemView(title: title)
        tabView.delegate = self

        tabs.append(tabView)
        stackView.addArrangedSubview(tabView)

        updateTabsState()
        addIndicatorWidthIfNeeded()
    }
}

extension Tab {

    private func setup() {
        backgroundColor = .white
        addStackView()
        addIndicatorView()
        setShadow()
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

    private func addIndicatorView() {
        addSubview(indicatorView)
        indicatorView.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            indicatorView.heightAnchor.constraint(equalToConstant: 2),
            indicatorView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
        addIndicatorLeadingConstraint(leadingAnchor: leadingAnchor)
    }

    private func addIndicatorWidthIfNeeded() {
        guard indicatorViewWidthConstraint == nil, let selectedTab = tabs.first else { return }

        indicatorViewWidthConstraint = indicatorView.widthAnchor.constraint(equalTo: selectedTab.widthAnchor)
        indicatorViewWidthConstraint?.isActive = true
    }

    private func addIndicatorLeadingConstraint(leadingAnchor: NSLayoutXAxisAnchor) {
        if let constraint = indicatorViewLeadingConstraint {
            constraint.isActive = false
        }

        let leadingConstraint = indicatorView.leadingAnchor.constraint(equalTo: leadingAnchor)
        leadingConstraint.isActive = true

        indicatorViewLeadingConstraint = leadingConstraint
    }

    private func setShadow() {
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.14
        layer.masksToBounds = false
        layer.shadowColor = Colors.highlight.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3)
    }
}

extension Tab {

    private func handleIndexChange() {
        updateTabsState()
        updateIndicatorX()
        delegate?.didChangeSelectedSegmented(index: selectedIndex)
    }

    private func updateTabsState() {
        for (index, tab) in tabs.enumerated() {
            tab.state = index == selectedIndex ? .selected : .normal
        }
    }

    private func updateIndicatorX() {
        let selectedTab = tabs[selectedIndex]
        addIndicatorLeadingConstraint(leadingAnchor: selectedTab.leadingAnchor)

        UIView.animate(withDuration: 0.1) { [unowned self] in
            self.layoutIfNeeded()
        }
    }
}

extension Tab: TabItemViewDelegate {

    func didTapTabItem(_ tabItemView: TabItemView) {
        if let index = tabs.firstIndex(where: { $0 == tabItemView }) {
            selectedIndex = index
        }
    }
}
