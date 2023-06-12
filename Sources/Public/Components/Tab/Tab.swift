/**
 - NOTE:
 This component is available in the following positions:
 - ✅ Fixed
 - ✅ Scrollable
 
 Tab is a class that represents a  component from the design system.
 A new tab is inserted using insertTab(title: String) method.
 
 It can be configured with the variants:
 - Fixed (default)
 - Scrollable
 
 Example of usage:
 - tab.insertTab(title: "Tab One")
 - tab.configure(position: .scrollable)
 
 It's possible to select a tab using the selectedSegmentedIndex property after insert all tabs:
 - tab.selectedSegmentedIndex = 1
 
 - Requires:
 It's necessary to configure the Design System with a theme or fatalError will be raised.
 
 DesignSystem().configure(with: AvailableTheme)
 */

import Foundation

public protocol TabDelegate: AnyObject {
    func didChangeSelectedSegmented(index: Int)
}

public class Tab: UIView {
    /// Position is an enum that represents if the tabBar is fixed or scrollable
    public enum Position {
        case fixed
        case scrollable
    }

    private var defaultIndex: Int?
    private(set) var stackWidthConstraint: NSLayoutConstraint?
    public weak var delegate: TabDelegate?
    private var indicatorViewWidthConstraint: NSLayoutConstraint?
    private var indicatorViewLeadingConstraint: NSLayoutConstraint?
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
            updateScrollPosition()
        }
    }

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceHorizontal = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = NatColors.surface
        return scrollView
    }()

    private lazy var indicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = NatColors.primary
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var theme:AvailableTheme = .none
    var primaryColor: UIColor = .white

    public init(theme:AvailableTheme = .none) {
        super.init(frame: .zero)
        
        self.theme = theme
        if (self.theme == .none) {
            primaryColor = NatColors.primary
        }
        else {
            primaryColor = hexStringToUIColor(hex: self.theme.newInstance.tokens.colorPrimary)
        }
        
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
        if defaultIndex == nil && tabs.count > 0 {
            updateTabsState()
            updateIndicatorX()
            defaultIndex = 0
        }
    }
}

extension Tab {

    private func setup() {
        backgroundColor = .white
        addScrollView()
        addStackView()
        addIndicatorView()
        configure(elevation: false)
        setupUI()
    }

    private func addScrollView() {
        addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: NatSizes.medium),
            self.heightAnchor.constraint(greaterThanOrEqualToConstant: NatSizes.medium)
        ])
        scrollView.showsHorizontalScrollIndicator = false
    }

    private func addStackView() {
        scrollView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
        stackWidthConstraint = stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        stackWidthConstraint?.isActive = true
    }

    private func addIndicatorView() {
        
        indicatorView.backgroundColor = self.primaryColor
        
        addSubview(indicatorView)
        NSLayoutConstraint.activate([
            indicatorView.heightAnchor.constraint(equalToConstant: 2),
            indicatorView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }

    private func setupUI() {
        self.backgroundColor = NatColors.surface
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

    private func updateScrollPosition() {
        var offset: CGPoint = CGPoint(x: 0, y: 0)
        struct Limit {
            var min: CGFloat
            var max: CGFloat
        }
        var visibleArea = Limit(min: 0, max: 0)
        let tabArea = Limit(min: tabs[selectedIndex].frame.minX, max: tabs[selectedIndex].frame.maxX)
        visibleArea.min = scrollView.contentOffset.x
        visibleArea.max = visibleArea.min + scrollView.frame.maxX
        let maxScroll: Limit = Limit(min: 0, max: tabs[tabs.count-1].frame.maxX - scrollView.frame.maxX)
        if  tabArea.max + 30 > visibleArea.max {
            offset.x = tabArea.max - visibleArea.max + 45 + visibleArea.min
            if offset.x > maxScroll.max {
                offset.x = maxScroll.max
            }
            scrollView.setContentOffset(offset, animated: true)
        } else {
            if tabArea.min - 30  < visibleArea.min {
                offset.x = tabArea.min - 45
                if offset.x < maxScroll.min {
                    offset.x = maxScroll.min
                }
                scrollView.setContentOffset(offset, animated: true)
            }
        }
    }
    private func updateIndicatorX() {
        let selectedTab = tabs[selectedIndex]
        indicatorViewLeadingConstraint?.isActive = false
        indicatorViewWidthConstraint?.isActive = false
        indicatorViewLeadingConstraint = indicatorView.leadingAnchor.constraint(equalTo: selectedTab.leadingAnchor)
        indicatorViewWidthConstraint = indicatorView.trailingAnchor.constraint(equalTo: selectedTab.trailingAnchor)
        indicatorViewLeadingConstraint?.isActive = true
        indicatorViewWidthConstraint?.isActive = true
        updateScrollPosition()
        UIView.animate(withDuration: 0.1) { [unowned self] in
            self.layoutIfNeeded()
        }
    }
    // MARK: - Public Methods

    /// Sets the position comportament of the component.
    ///
    /// Example of usage:
    /// ```
    /// Tab.configure(position: .fixed)
    /// Tab.configure(position: .scrollable)
    /// ```
    public func configure(position: Position) {
        switch position {
        case .fixed:
            stackWidthConstraint?.isActive = true
        case .scrollable:
            stackWidthConstraint?.isActive = false
        }
    }
    
    /// Sets if the tab has elevation
    /// - Parameter elevation: a bool that indicates if the tab has elevation
    ///
    /// Example of usage:
    /// ```
    /// Tab.configure(elevation: true)
    /// ```
    public func configure(elevation: Bool) {
        if elevation {
            NatElevation.apply(on: self, elevation: .micro)
        } else {
            NatElevation.apply(on: self, elevation: .none)
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
