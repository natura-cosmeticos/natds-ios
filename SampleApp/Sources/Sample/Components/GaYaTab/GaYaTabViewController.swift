//
//  GaYaTabViewController.swift
//  NatDS-SampleApp
//
//  Created by Hayna.Cardoso on 27/03/25.
//  Copyright © 2025 Natura. All rights reserved.
//

import UIKit
import NatDS

class GaYaTabViewController: UIViewController, SampleItem {
  static var name: String = "GaYaTab"
  
  private lazy var stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.distribution = .equalSpacing
    stackView.axis = .vertical
    stackView.spacing = 80
    return stackView
  }()
  private let scrollableTab = GaYaTab()
  private let fixedTab = GaYaTab()
  private let scrollableTabWithoutElevation = GaYaTab(theme: .avonLight)
  private let iconTabs = GaYaTab()
  
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
    fixedTab.insertTab(title: "NATURA")
    fixedTab.insertTab(title: "TBS")
    fixedTab.configure(position: .fixed)
    fixedTab.configure(elevation: true)
    
    // Scrollable
    addTab(tab: scrollableTab)
    scrollableTab.delegate = self
    scrollableTab.insertTab(title: "AVON")
    scrollableTab.insertTab(title: "CONSULTORIA DE BELEZA")
    scrollableTab.insertTab(title: "FORÇA DE VENDAS")
    scrollableTab.insertTab(title: "NATURA")
    scrollableTab.insertTab(title: "THE BODY SHOP")
    scrollableTab.configure(position: .scrollable)
    scrollableTab.configure(elevation: true)
    
    // ScrollableWithoutElevation
    addTab(tab: scrollableTabWithoutElevation)
    scrollableTabWithoutElevation.delegate = self
    scrollableTabWithoutElevation.insertTab(title: "CONSULTORIA DE BELEZA")
    scrollableTabWithoutElevation.insertTab(title: "NATURA")
    scrollableTabWithoutElevation.insertTab(title: "AVON")
    scrollableTabWithoutElevation.insertTab(title: "FORÇA DE VENDAS")
    scrollableTabWithoutElevation.insertTab(title: "THE BODY SHOP")
    scrollableTabWithoutElevation.configure(position: .scrollable)
    
    // Icon Tabs (exemplos com ícone à esquerda, em cima e sozinho)
    addTab(tab: iconTabs)
    iconTabs.delegate = self
    iconTabs.insertTab(title: "AVON", style: .iconLeft(icon: getIcon(.outlinedProductHair)))
    iconTabs.insertTab(title: "GAYA TAB", style: .iconTop(icon: getIcon(.outlinedProductSpray)))
    iconTabs.insertTab(style: .iconOnly(icon: getIcon(.outlinedProductBlush)))
    iconTabs.insertTab(title: "NATURA")
    iconTabs.configure(position: .fixed)
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
  
  private func addTab(tab: GaYaTab) {
    stackView.addArrangedSubview(tab)
    tab.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      tab.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
      tab.trailingAnchor.constraint(equalTo: stackView.trailingAnchor)
    ])
  }
}

extension GaYaTabViewController: GaYaTabDelegate {
  
  func didChangeSelectedSegmented(index: Int) {
    print("selected index: \(index)")
  }
}
