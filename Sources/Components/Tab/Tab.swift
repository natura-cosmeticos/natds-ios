import Foundation

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
        refreshIndicatorViewFrame()
    }
}

public extension Tab {

    func insertTab(title: String) {
        let index = tabs.count
        let tabView = TabItemView(index: index, title: title)
        tabView.delegate = self
        tabView.changeStateBySelectedIndex(selectedIndex)

        stackView.addArrangedSubview(tabView)
        tabs.append(tabView)
        refreshIndicatorViewFrame()
    }
}

extension Tab {

    private var widthForSegment: CGFloat {
        let numberOfSegments = tabs.count
        guard numberOfSegments > 0 else { return 0 }
        return self.frame.size.width/CGFloat(numberOfSegments)
    }

    private func setup() {
        backgroundColor = .clear
        addStackView()
        addIndicatorView()
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

    private func refreshIndicatorViewFrame() {
        layoutIfNeeded()

        let contentHeight = self.frame.size.height
        let originalFrame = indicatorView.frame
        indicatorView.frame = CGRect(
            x: originalFrame.origin.x,
            y: contentHeight - 2,
            width: widthForSegment,
            height: originalFrame.height
        )
    }
}

extension Tab {

    private func handleIndexChange() {
        handleTabsState()
        handleIndicatorOrigin()
    }

    private func handleTabsState() {
        for tab in tabs {
            tab.changeStateBySelectedIndex(selectedIndex)
        }
    }

    private func handleIndicatorOrigin() {
        let index = selectedIndex

        UIView.animate(withDuration: 0.1) { [unowned self] in

            if index == 0 {
                self.indicatorView.frame.origin.x = 0
            } else if index == self.tabs.count - 1 {
                self.indicatorView.frame.origin.x = self.bounds.size.width - self.indicatorView.bounds.size.width
            } else {
                self.indicatorView.frame.origin.x = (CGFloat(index) * self.widthForSegment)
            }

            self.layoutIfNeeded()
        }
    }
}

extension Tab: TabItemViewDelegate {

    func didTapTabItemAt(index: Int) {
        selectedIndex = index
    }
}
