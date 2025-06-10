//
//  GaYaCheckboxViewController.swift
//  NatDS-SampleApp
//
//  Created by Hayna.Cardoso on 06/06/25.
//  Copyright © 2025 Natura. All rights reserved.
//

import NatDS
import UIKit

final class GaYaCheckboxViewController: UIViewController, SampleItem {

    static let name = "GaYaCheckbox"

    // MARK: - Private properties

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        return scrollView
    }()

    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = GaYaDimensions.spacingTiny
        stackView.distribution = .fillEqually
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    private let enabledUnselectedCheckbox: GaYaCheckbox = {
        let checkbox = GaYaCheckbox()
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    private let enabledSelectedCheckbox: GaYaCheckbox = {
        let checkbox = GaYaCheckbox()
        checkbox.configure(isSelected: true)
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    private let indeterminateEnabledSelectedCheckbox: GaYaCheckbox = {
        let checkbox = GaYaCheckbox()
        checkbox.configure(isSelected: true)
        checkbox.configure(isIndeterminate: true)
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    private let disabledUnselectedCheckbox: GaYaCheckbox = {
        let checkbox = GaYaCheckbox()
        checkbox.configure(isSelected: false)
        checkbox.configure(isEnabled: false)
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    private let disabledSelectedCheckbox: GaYaCheckbox = {
        let checkbox = GaYaCheckbox()
        checkbox.configure(isSelected: true)
        checkbox.configure(isEnabled: false)
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    private let indeterminateDisabledSelectedCheckbox: GaYaCheckbox = {
        let checkbox = GaYaCheckbox()
        checkbox.configure(isSelected: true)
        checkbox.configure(isEnabled: false)
        checkbox.configure(isIndeterminate: true)
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    private let enabledUnselectedLabelCheckbox: GaYaCheckbox = {
        let checkbox = GaYaCheckbox(theme: .avonLight)
        checkbox.configure(text: "Enabled unselected with label")
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    private let enabledSelectedLabelCheckbox: GaYaCheckbox = {
        let checkbox = GaYaCheckbox(theme: .avonLight)
        checkbox.configure(isSelected: true)
        checkbox.configure(text: "Enabled selected with label")
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    private let disabledUnselectedLabelCheckbox: GaYaCheckbox = {
        let checkbox = GaYaCheckbox()
        checkbox.configure(isSelected: false)
        checkbox.configure(isEnabled: false)
        checkbox.configure(isIndeterminate: true)
        checkbox.configure(text: "Disabled unselected with label")
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    private let disabledSelectedLabelCheckbox: GaYaCheckbox = {
        let checkbox = GaYaCheckbox()
        checkbox.configure(isSelected: true)
        checkbox.configure(isEnabled: false)
        checkbox.configure(text: "Disabled selected with label")
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    private let indeterminateEnableSelectedLabelCheckbox: GaYaCheckbox = {
        let checkbox = GaYaCheckbox()
        checkbox.configure(isSelected: true)
        checkbox.configure(isEnabled: true)
        checkbox.configure(text: "Indeterminate enable selected with label")
        checkbox.configure(isIndeterminate: true)
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    // swiftlint:disable:next identifier_name
    private let indeterminateDisabledSelectedLabelCheckbox: GaYaCheckbox = {
        let checkbox = GaYaCheckbox()
        checkbox.configure(isSelected: true)
        checkbox.configure(isEnabled: false)
        checkbox.configure(text: "Indeterminate disabled selected with label")
        checkbox.configure(isIndeterminate: true)
        checkbox.translatesAutoresizingMaskIntoConstraints = false

        return checkbox
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupHandlers()
    }

    // MARK: - Private methods

    private func setup() {
        title = Self.name
        view.backgroundColor = GaYaColors.background
        view.addSubview(scrollView)

        scrollView.addSubview(containerView)

        containerView.addSubview(stackView)

        stackView.addArrangedSubview(enabledUnselectedCheckbox)
        stackView.addArrangedSubview(enabledSelectedCheckbox)
        stackView.addArrangedSubview(indeterminateEnabledSelectedCheckbox)
        stackView.addArrangedSubview(disabledUnselectedCheckbox)
        stackView.addArrangedSubview(disabledSelectedCheckbox)
        stackView.addArrangedSubview(indeterminateDisabledSelectedCheckbox)
        stackView.addArrangedSubview(enabledUnselectedLabelCheckbox)
        stackView.addArrangedSubview(enabledSelectedLabelCheckbox)
        stackView.addArrangedSubview(indeterminateEnableSelectedLabelCheckbox)
        stackView.addArrangedSubview(disabledUnselectedLabelCheckbox)
        stackView.addArrangedSubview(disabledSelectedLabelCheckbox)
        stackView.addArrangedSubview(indeterminateDisabledSelectedLabelCheckbox)

        addConstraints()
    }
}

extension GaYaCheckboxViewController {

    private func addConstraints() {
        let containerHeightConstraint = containerView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        containerHeightConstraint.priority = .defaultLow

        let constraints = [
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),

            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -GaYaDimensions.spacingSmall),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: GaYaDimensions.spacingSmall),
            containerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            containerHeightConstraint,

            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: GaYaDimensions.spacingSmall),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            stackView.bottomAnchor.constraint(
                greaterThanOrEqualTo: containerView.bottomAnchor,
                constant: -GaYaDimensions.spacingSmall
            )
        ]

        NSLayoutConstraint.activate(constraints)
    }

    private func setupHandlers() {
        enabledUnselectedCheckbox.configure { isChecked in
            let alert = UIAlertController(title: "Taps",
                                          message: "It's marked as \(isChecked)",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok",
                                          style: .default,
                                          handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
