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

    private var tabs: [TabItemView] = []

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
        let tabView = TabItemView(title: title)
        tabView.delegate = self

        stackView.addArrangedSubview(tabView)
        tabs.append(tabView)
        refreshIndicatorViewFrame()
        handleTabsState()
    }
}

extension Tab {

    private var widthForSegment: CGFloat {
        let numberOfSegments = tabs.count
        guard numberOfSegments > 0 else { return 0 }
        return self.frame.size.width/CGFloat(numberOfSegments)
    }

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

        handleIndicatorOrigin()
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
        handleTabsState()
        handleIndicatorOrigin()
        delegate?.didChangeSelectedSegmented(index: selectedIndex)
    }

    private func handleTabsState() {
        for (index, tab) in tabs.enumerated() {
            tab.setState(state: index == selectedIndex ? .selected : .normal)
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

    func didTapTabItem(_ tabItemView: TabItemView) {
        if let index = tabs.firstIndex(where: { $0 == tabItemView }) {
            selectedIndex = index
        }
    }

    func didTapTabItemAt(index: Int) {
        selectedIndex = index
    }
}
