//
//  GaYaSelectItemViewController.swift
//  GaYa DS-SampleApp
//
//  Created by Hayna.Cardoso on 12/02/25.
//  Copyright © 2025 Natura. All rights reserved.
//

import UIKit
import NatDS

class GaYaSelectItemViewController: UIViewController, SampleItem {
    static var name: String = "GaYaSelect"

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.alwaysBounceHorizontal = false
        scrollView.keyboardDismissMode = .interactive
        return scrollView
    }()

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .fillProportionally
        return stack
    }()

    private lazy var standardSelect: GaYaSelect = {
        let field = GaYaTextField(theme: .avonLight)
        field.title = "Standard select"
        field.type = .text
        field.placeholder = "Select an item"
        let select = GaYaSelect(textField: field)
        select.configure(data: ["Item 1", "Item 2"])
        return select
    }()

    private lazy var formattedSelect: GaYaSelect = {
        let field = GaYaTextField()
        field.title = "Formatted select"
        field.type = .text
        field.placeholder = "Select an item"
        let select = GaYaSelect(textField: field)
        select.configure(data: ["Item 1", "Item 2"])
        select.configure(format: "Selected: %@")
        return select
    }()

    private lazy var multipleComponentsWithFormatSelect: GaYaSelect = {
        let field = GaYaTextField()
        field.title = "Multiple components with format select"
        field.type = .text
        field.placeholder = "Select two items"
        let select = GaYaSelect(textField: field)
        select.configure(data: [0: ["Item 1", "Item 2"],
                                1: ["Item 3", "Item 4"]])
        select.configure(format: "First: %@, second: %@")
        return select
    }()

    private lazy var errorSelect: GaYaSelect = {
        let field = GaYaTextField()
        field.title = "Error"
        field.placeholder = "Input with error"
        field.configure(state: .error, with: "Opss... this input has an error!")
        let select = GaYaSelect(textField: field)
        select.configure(data: ["Item 1", "Item 2"])
        return select
    }()

    // swiftlint:disable line_length
    private lazy var errorSelectMultipleLines: GaYaSelect = {
        let field = GaYaTextField()
        field.title = "Error"
        field.placeholder = "Input with error"
        field.configure(state: .error,
                        with: "Opss... this input has an error - Neque porro quisquam est qui dolorem ipsum quia dolor sit amet.")
        let select = GaYaSelect(textField: field)
        select.configure(data: ["Item 1", "Item 2"])
        return select
    }()
    // swiftlint:enable line_length

    private lazy var helperSelect: GaYaSelect = {
        let field = GaYaTextField()
        field.title = "Helper"
        field.placeholder = "Input with helper"
        field.helper = "This input has a helper text"
        let select = GaYaSelect(textField: field)
        select.configure(data: ["Item 1", "Item 2"])
        return select
    }()

    private lazy var mediumSelect: GaYaSelect = {
        let field = GaYaTextField()
        field.configure(size: .medium)
        field.title = "Medium Size"
        field.type = .text
        field.placeholder = "A select with height size medium"
        let select = GaYaSelect(textField: field)
        select.configure(data: ["Item 1", "Item 2"])
        return select
    }()

    private lazy var mediumXSelect: GaYaSelect = {
        let field = GaYaTextField()
        field.configure(size: .mediumX)
        field.title = "MediumX Size (Default)"
        field.type = .text
        field.placeholder = "A select with height size mediumX"
        let select = GaYaSelect(textField: field)
        select.configure(data: ["Item 1", "Item 2"])
        return select
    }()

    private lazy var successSelect: GaYaSelect = {
        let field = GaYaTextField()
        field.title = "Success"
        field.type = .text
        field.placeholder = "Input with success"
        field.configure(state: .success, with: "Success message validating what's typed.")
        let select = GaYaSelect(textField: field)
        select.configure(data: ["Item 1", "Item 2"])
        return select
    }()

    private lazy var longSuccessSelect: GaYaSelect = {
        let field = GaYaTextField()
        field.title = "Success"
        field.type = .text
        field.placeholder = "Input with success"
        field.configure(state: .success,
                        with: "A very, very long success message validating what's typed and giving more info.")
        let select = GaYaSelect(textField: field)
        select.configure(data: ["Item 1", "Item 2"])
        return select
    }()

    private lazy var requiredSelect: GaYaSelect = {
        let field = GaYaTextField()
        field.title = "Required"
        field.type = .text
        field.placeholder = "This select is required"
        field.configure(required: true)
        let select = GaYaSelect(textField: field)
        select.configure(data: ["Item 1", "Item 2"])
        return select
    }()

    private lazy var disabledSelect: GaYaSelect = {
        let field = GaYaTextField()
        field.title = "Disabled"
        field.type = .text
        field.placeholder = "Disabled input"
        field.configure(isEnabled: false)
        let select = GaYaSelect(textField: field)
        select.configure(data: ["Item 1", "Item 2"])
        return select
    }()

    private lazy var readOnlySelect: GaYaSelect = {
        let field = GaYaTextField()
        field.title = "Read only"
        field.type = .text
        field.text = "Input is read-only"
        field.configure(readOnly: true)
        let select = GaYaSelect(textField: field)
        select.configure(data: ["Item 1", "Item 2"])
        return select
    }()

    private lazy var filledSelect: GaYaSelect = {
        let field = GaYaTextField()
        field.title = "Filled"
        field.type = .text
        field.text = "Filled select"
        let select = GaYaSelect(textField: field)
        select.configure(data: ["Item 1", "Item 2"])
        return select
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapView))
        view.addGestureRecognizer(tapGesture)
    }

    private func setup() {
        title = Self.name

        view.backgroundColor = NatColors.background

        view.addSubview(scrollView)

        scrollView.addSubview(stackView)

        addConstraints()
        stackView.addArrangedSubview(standardSelect)
        stackView.addArrangedSubview(formattedSelect)
        stackView.addArrangedSubview(multipleComponentsWithFormatSelect)
        stackView.addArrangedSubview(errorSelect)
        stackView.addArrangedSubview(errorSelectMultipleLines)
        stackView.addArrangedSubview(helperSelect)
        stackView.addArrangedSubview(mediumSelect)
        stackView.addArrangedSubview(mediumXSelect)
        stackView.addArrangedSubview(successSelect)
        stackView.addArrangedSubview(longSuccessSelect)
        stackView.addArrangedSubview(requiredSelect)
        stackView.addArrangedSubview(filledSelect)
        stackView.addArrangedSubview(disabledSelect)
        stackView.addArrangedSubview(readOnlySelect)
    }

    private func addConstraints() {

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    @objc func didTapView() {
        view.endEditing(true)
    }
}
