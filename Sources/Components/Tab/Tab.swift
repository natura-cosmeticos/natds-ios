import Foundation

public struct TabItem {
    var title: String
}

public class Tab: UIView {

    public var selectedIndex: Int = 0 {
        didSet {
            handleIndexChange()
        }
    }

    private var tabs: [TabItemView] = []

    private lazy var indicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.primary
        return view
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal

        return stackView
    }()

    public init() {
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func layoutSubviews() {
        super.layoutSubviews()

        let contentHeight = self.frame.size.height
        let originalFrame = indicatorView.frame
        indicatorView.frame = CGRect(
            x: originalFrame.origin.x,
            y: contentHeight - 2,
            width: widthForSegment,
            height: originalFrame.height
        )
    }

    public func insertTabs(tabs: [TabItem]) {
        let views = tabs
            .enumerated()
            .map { (index, tab) -> TabItemView in
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

    private var widthForSegment: CGFloat {
        let numberOfSegments = tabs.count
        guard numberOfSegments > 0 else { return 0 }
        return self.bounds.size.width/CGFloat(numberOfSegments)
    }

    private func setup() {
        backgroundColor = .clear
        addStackView()
        addIndicatorView()
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

    private func addIndicatorView() {
        addSubview(indicatorView)

        indicatorView.frame = CGRect(x: 0, y: 0, width: 0, height: 2)
        layoutIfNeeded()
    }
}

extension Tab {

    private func handleIndexChange() {
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
