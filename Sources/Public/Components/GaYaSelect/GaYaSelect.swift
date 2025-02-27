//
//  GaYaSelect.swift
//  NatDS
//
//  Created by Hayna.Cardoso on 12/02/25.
//  Copyright © 2025 Natura. All rights reserved.
//

import UIKit

/**
 GaYaSelect is a class that represents the select component from the design system.
 
 Example of usage:

        let select = GaYaSelect(textField: textField)
        select.configure(data: ["Item 1", "Item 2"])
        select.configure(data: [0: ["Item 1", "Item 2"], 1: ["Item 3", "Item 4"]])
 
        select.configure(format: "First: %@, Second: %@")

 - Requires:
 It's necessary to configure the Design System with a theme or fatalError will be raised.

        DesignSystem().configure(with: AvailableTheme)
 */
public class GaYaSelect: UIView {

    private var textField: GaYaTextField
    private var theme: AvailableTheme
    private var data: [Int: [String]] = [:]
    private var format: String?

    private lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        return pickerView
    }()

    public init(textField: GaYaTextField, theme:AvailableTheme = .none) {
        self.textField = textField
        self.theme = textField.theme
        super.init(frame: .zero)
        textField.delegate = self
        textField.setPickerView(pickerView: pickerView)
        setup()
    }

    // MARK: - Public Methods

    /// Sets a dictionary to feed the component
    ///
    /// Example of usage:
    /// ```
    /// natSelect.configure(data: [0: ["Item 1", "Item 2"], 1: ["Item 3", "Item 4"]])
    /// ```
    /// - Parameter data: A `Dictionary` that feed the component
    public func configure(data: [Int: [String]]) {
        self.data = data
    }

    /// Sets a array of string to feed the component
    ///
    /// Example of usage:
    /// ```
    /// natSelect.configure(data: ["Item 1", "Item 2"])
    /// ```
    /// - Parameter data: A `Array of Strings` that feed the component
    public func configure(data: [String]) {
        self.data[.zero] = data
    }

    /// Sets format to format the text inside of the text field
    ///
    /// Example of usage:
    /// ```
    /// natSelect.configure(format: "Selected: %@")
    /// ```
    /// - Parameter format: A `String` that format the text inside of the text field
    public func configure(format: String) {
        self.format = format
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(textField)
        addConstraints()
    }

    private func addConstraints() {
        textField.translatesAutoresizingMaskIntoConstraints = false

        textField.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        textField.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        textField.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        textField.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
}

extension GaYaSelect: UIPickerViewDelegate, UIPickerViewDataSource {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return data.count
    }

    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data[component]?.count ?? .zero
    }

    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[component]?[row]
    }

    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let format = format {
            var arguments: [String] = []
            let sortedKeys = data.keys.sorted()
            sortedKeys.forEach {
                if let value = data[$0]?[pickerView.selectedRow(inComponent: $0)] {
                    arguments.append(value)
                }
            }
            textField.text = String(format: format, arguments: arguments)
        } else {
            textField.text = data[component]?[row]
        }
    }
}

extension GaYaSelect: UITextFieldDelegate {
    public func textField(_ textField: UITextField,
                          shouldChangeCharactersIn range: NSRange,
                          replacementString string: String) -> Bool {
        return false
    }
}

