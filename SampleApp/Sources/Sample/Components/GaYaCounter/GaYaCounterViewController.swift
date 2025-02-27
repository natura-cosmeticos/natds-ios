//
//  GaYaCounterViewController.swift
//  NatDS-SampleApp
//
//  Created by Hayna.Cardoso on 12/02/25.
//  Copyright © 2025 Natura. All rights reserved.
//

import UIKit
import NatDS

class GaYaCounterViewController: UIViewController, SampleItem {
    static var name: String = "GaYaCounter"

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = GaYaDimensions.spacingSemi
        stackView.distribution = .equalCentering
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    let enableMediumCounter: GaYaCounter = {
        let counter = GaYaCounter(size: .medium)
        counter.translatesAutoresizingMaskIntoConstraints = false

        return counter
    }()

    let enableMediumCounterWithLabel: GaYaCounter = {
        let counter = GaYaCounter(size: .medium, minimumValue: .value1)
        counter.configure(label: "All Enabled Medium")
        counter.configureKeyboard(state: .disabled)
        counter.translatesAutoresizingMaskIntoConstraints = false
        
        return counter
    }()

    let subtractDisabledMediumCounter: GaYaCounter = {
        let counter = GaYaCounter(size: .medium)
        counter.configure(label: "Subtract Disabled Medium")
        counter.configure(button: .subtract, state: .disabled)
        counter.translatesAutoresizingMaskIntoConstraints = false

        return counter
    }()

    let addDisabledSemiCounter: GaYaCounter = {
        let counter = GaYaCounter(size: .semi)
        counter.configure(label: "Add Disabled Semi")
        counter.configure(button: .add, state: .disabled)
        counter.translatesAutoresizingMaskIntoConstraints = false

        return counter
    }()

    let allDisabledSemiCounter: GaYaCounter = {
        let counter = GaYaCounter(size: .semi)
        counter.configure(label: "All Disabled Semi")
        counter.configure(button: .all, state: .disabled)
        counter.translatesAutoresizingMaskIntoConstraints = false

        return counter
    }()

    override func viewDidLoad() {
        title = Self.name
        view.backgroundColor = GaYaColors.background
        setup()
        setupHandlers()
    }

    private func setup() {
        view.addSubview(stackView)

        stackView.addArrangedSubview(enableMediumCounter)
        stackView.addArrangedSubview(enableMediumCounterWithLabel)
        stackView.addArrangedSubview(subtractDisabledMediumCounter)
        stackView.addArrangedSubview(addDisabledSemiCounter)
        stackView.addArrangedSubview(allDisabledSemiCounter)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    private func setupHandlers() {
        enableMediumCounter.configure { value in
            let alert = UIAlertController(title: "Taps",
                                          message: "You've selected number \(value)",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok",
                                          style: .default,
                                          handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

