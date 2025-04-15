//
//  GaYaTab.swift
//  NatDS
//
//  Created by Hayna.Cardoso on 27/03/25.
//  Copyright © 2025 Natura. All rights reserved.
//

import Foundation

public protocol GaYaTabDelegate: AnyObject {
  func didChangeSelectedSegmented(index: Int)
}

public class GaYaTab: UIView {
  public enum Position {
    case fixed
    case scrollable
  }
  
  private var defaultIndex: Int?
  private(set) var stackWidthConstraint: NSLayoutConstraint?
  public weak var delegate: GaYaTabDelegate?
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
  
  private(set) var tabs: [GaYaTabItemView] = []
  
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
    scrollView.backgroundColor = GaYaColors.surface
    return scrollView
  }()
  
  private lazy var indicatorView: UIView = {
    let view = UIView()
    view.backgroundColor = GaYaColors.primary
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
      primaryColor = GaYaColors.primary
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

public extension GaYaTab {
  
  func insertTab(title: String = "", style: GaYaTabItemView.ContentStyle = .textOnly) {
    let tabView = GaYaTabItemView(title: title)
    tabView.contentStyle = style
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

extension GaYaTab {
  
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
      scrollView.heightAnchor.constraint(equalToConstant: GaYaSizes.medium),
      self.heightAnchor.constraint(greaterThanOrEqualToConstant: GaYaSizes.medium)
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
    self.backgroundColor = GaYaColors.surface
  }
}

extension GaYaTab {
  
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
  
  public func configure(position: Position) {
    switch position {
    case .fixed:
      stackWidthConstraint?.isActive = true
      stackView.distribution = .fillEqually
      
    case .scrollable:
      stackWidthConstraint?.isActive = false
      stackView.distribution = .fillProportionally
    }
  }
  
  public func configure(elevation: Bool) {
    if elevation {
      GaYaElevation.apply(on: self, elevation: .micro)
    } else {
      GaYaElevation.apply(on: self, elevation: .none)
    }
  }
}

extension GaYaTab: GaYaTabItemViewDelegate {
  
  func didTapTabItem(_ tabItemView: GaYaTabItemView) {
    if let index = tabs.firstIndex(where: { $0 == tabItemView }) {
      selectedIndex = index
    }
  }
}
