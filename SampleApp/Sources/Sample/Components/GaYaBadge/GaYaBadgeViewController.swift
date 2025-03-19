//
//  GaYaBadgeViewController.swift
//  GaYa DS-SampleApp
//
//  Created by Hayna.Cardoso on 13/02/25.
//  Copyright © 2025 Natura. All rights reserved.
//

import UIKit
import NatDS

class GaYaBadgeViewController: UIViewController, SampleItem {
    static var name: String = "GaYaBadge"

    private lazy var badgeableViewDot: GaYaBadgeableView = {
        let view = GaYaBadgeableView(frame: .init(x: 0, y: 0, width: 24, height: 24))
        view.configure(badgeStyle: .dot, withColor: .primary)
        return view
    }()

    private lazy var badgeableViewPulse: GaYaBadgeableView = {
        let view = GaYaBadgeableView(frame: .init(x: 0, y: 0, width: 24, height: 24))
        view.configure(badgeStyle: .pulse, withColor: .primary)
        return view
    }()

    private lazy var badgeableViewOneChartStandard: GaYaBadgeableView = {
        let view = GaYaBadgeableView(frame: .init(x: 0, y: 0, width: 24, height: 24))
        view.configure(badgeStyle: .standard, withColor: .primary, theme: .avonLight)
        view.setBadge(count: 100)
        view.configure(limit: .max9)
        return view
    }()

    private lazy var badgeableViewTwoCharStandard: GaYaBadgeableView = {
        let view = GaYaBadgeableView(frame: .init(x: 0, y: 0, width: 24, height: 24))
        view.configure(badgeStyle: .standard, withColor: .secondary)
        view.setBadge(count: 100)
        view.configure(limit: .max99)
        return view
    }()

    private lazy var badgeableViewThreeCharStandard: GaYaBadgeableView = {
        let view = GaYaBadgeableView(frame: .init(x: 0, y: 0, width: 24, height: 24))
        view.configure(badgeStyle: .standard, withColor: .success)
        view.setBadge(count: 123)
        view.configure(limit: .unlimited)
        return view
    }()
  
  private lazy var badgeableViewFourCharStandard: GaYaBadgeableView = {
      let view = GaYaBadgeableView(frame: .init(x: 0, y: 0, width: 24, height: 24))
    view.configure(badgeStyle: .standard, withColor: .inverse)
      view.setBadge(count: 1234)
      view.configure(limit: .unlimited)
      return view
  }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
      stackView.spacing = GaYaDimensions.spacingXLarge
        stackView.distribution = .fillProportionally
        stackView.alignment = .top
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        title = Self.name
        view.backgroundColor = hexStringToUIColor(hex: "#f4f4f4")

        view.addSubview(stackView)
        stackView.addArrangedSubview(badgeableViewDot)
        stackView.addArrangedSubview(badgeableViewPulse)
        stackView.addArrangedSubview(badgeableViewOneChartStandard)
        stackView.addArrangedSubview(badgeableViewTwoCharStandard)
        stackView.addArrangedSubview(badgeableViewThreeCharStandard)
        stackView.addArrangedSubview(badgeableViewFourCharStandard)

        let constraints = [
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 12)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}

class GaYaBadgeableView: UIView {}

extension GaYaBadgeableView: GaYaBadgeable {}
