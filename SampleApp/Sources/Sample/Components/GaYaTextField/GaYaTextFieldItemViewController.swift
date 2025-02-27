//
//  GaYaTextFieldItemViewController.swift
//  NatDS-SampleApp
//
//  Created by Hayna.Cardoso on 12/02/25.
//  Copyright © 2025 Natura. All rights reserved.
//

import UIKit
import NatDS

class GaYaTextFieldItemViewController: UIViewController, SampleItem {
    static var name: String = "GaYaTextField"

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

    private lazy var textField: GaYaTextField = {
        let field = GaYaTextField(theme: .avonLight)
        field.title = "Text"
        field.type = .text
        field.placeholder = "Type some text"
        field.delegate = self
        return field
    }()
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Iniciou a edição!")
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Iniciou a edição 2!")
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        print("Iniciou a edição 3!")
            
            // Removendo caracteres não numéricos
            let allowedCharacters = CharacterSet.decimalDigits
            let characterSet = CharacterSet(charactersIn: string)
            if !allowedCharacters.isSuperset(of: characterSet) {
                return false
            }
            
            let currentText = textField.text ?? ""
            let prospectiveText = (currentText as NSString).replacingCharacters(in: range, with: string)
            
            // Limita o comprimento da entrada para 19 (incluindo pontos)
            if prospectiveText.count > 19 {
                return false
            }
            
            // Aplicando a máscara
            if string.count > 0 {
                // Adicionando caracteres
                if (prospectiveText.count == 4) || (prospectiveText.count == 9) || (prospectiveText.count == 14) {
                    textField.text = currentText + string + "."
                    return false
                }
            } else {
                // Removendo caracteres
                if (currentText.count == 5) || (currentText.count == 10) || (currentText.count == 15) {
                    let index = currentText.index(before: currentText.endIndex)
                    textField.text = String(currentText[..<index])
                    return false
                }
            }
            
            return true
        }


    private lazy var textFieldTest: GaYaTextField = {
        let field = GaYaTextField()
        field.title = "Text"
        field.type = .text
        field.placeholder = "Type some text"
        field.delegate = self
        field.configure(delegate: self)
        return field
    }()

    private lazy var nameField: GaYaTextField = {
        let field = GaYaTextField()
        field.title = "Name"
        field.type = .name
        field.placeholder = "Type your name"
        field.delegate = self
        return field
    }()

    private lazy var numberTextField: GaYaTextField = {
        let field = GaYaTextField()
        field.title = "Number"
        field.type = .number
        field.placeholder = "Type numbers"
        field.delegate = self
        return field
    }()

    private lazy var passwordTextField: GaYaTextField = {
        let field = GaYaTextField()
        field.title = "Password"
        field.type = .password(keyboardType: .default)
        field.placeholder = "Type your password"
        field.delegate = self
        return field
    }()

    private lazy var numberPasswordTextField: GaYaTextField = {
        let field = GaYaTextField()
        field.title = "Password - Only numbers"
        field.type = .password(keyboardType: .numberPad)
        field.placeholder = "Type your password (only numbers)"
        field.delegate = self
        return field
    }()

    private lazy var errorTextField: GaYaTextField = {
        let field = GaYaTextField()
        field.title = "Error"
        field.placeholder = "Input with error"
        field.configure(state: .error, with: "Opss... this input has an error!")
        field.delegate = self
        return field
    }()

    // swiftlint:disable line_length
    private lazy var errorTextFieldMultpleLines: GaYaTextField = {
        let field = GaYaTextField()
        field.title = "Error"
        field.placeholder = "Input with error"
        field.configure(state: .error,
                        with: "Opss... this input has an error - Neque porro quisquam est qui dolorem ipsum quia dolor sit amet.")
        field.delegate = self
        return field
    }()
    // swiftlint:enable line_length

    private lazy var helperTextField: GaYaTextField = {
        let field = GaYaTextField()
        field.title = "Helper"
        field.placeholder = "Input with helper"
        field.helper = "This input has a helper text"
        field.delegate = self
        return field
    }()

    private lazy var mediumTextField: GaYaTextField = {
        let field = GaYaTextField()
        field.configure(size: .medium)
        field.title = "Medium Size"
        field.type = .text
        field.placeholder = "A text field with height size medium"
        field.delegate = self
        return field
    }()

    private lazy var mediumXTextField: GaYaTextField = {
        let field = GaYaTextField()
        field.configure(size: .mediumX)
        field.title = "MediumX Size (Default)"
        field.type = .text
        field.placeholder = "A text field with height size mediumX"
        field.delegate = self
        return field
    }()

    private lazy var successTextField: GaYaTextField = {
        let field = GaYaTextField()
        field.title = "Success"
        field.type = .text
        field.placeholder = "Input with success"
        field.configure(state: .success, with: "Success message validating what's typed.")
        field.delegate = self
        return field
    }()

    private lazy var longSuccessTextField: GaYaTextField = {
        let field = GaYaTextField()
        field.title = "Success"
        field.type = .text
        field.placeholder = "Input with success"
        field.configure(state: .success,
                        with: "A very, very long success message validating what's typed and giving more info.")
        field.delegate = self
        return field
    }()

    private lazy var requiredTextField: GaYaTextField = {
        let field = GaYaTextField()
        field.title = "Required"
        field.type = .text
        field.placeholder = "This text field is required"
        field.configure(required: true)
        field.delegate = self
        return field
    }()

    private lazy var disabledTextField: GaYaTextField = {
        let field = GaYaTextField()
        field.title = "Disabled"
        field.type = .text
        field.placeholder = "Disabled input"
        field.delegate = self
        field.configure(isEnabled: false)
        return field
    }()

    private lazy var readOnlyTextField: GaYaTextField = {
        let field = GaYaTextField()
        field.title = "Read only"
        field.type = .text
        field.text = "Input is read-only"
        field.delegate = self
        field.configure(readOnly: true)
        return field
    }()

    private lazy var filledTextField: GaYaTextField = {
        let field = GaYaTextField()
        field.title = "Filled"
        field.type = .text
        field.text = "Filled text field"
        field.delegate = self
        return field
    }()

    private lazy var actionIconTextField: GaYaTextField = {
        let field = GaYaTextField()
        field.title = "Action with icon"
        field.type = .text
        field.placeholder = "Icon has action on touch"
        field.configure(iconButton: iconButton)
        field.delegate = self
        return field
    }()

    private lazy var iconButton: NatIconButton = {
        let iconButton = NatIconButton(style: .standardDefault)
        iconButton.configure(icon: getIcon(.outlinedDefaultMockup))
        iconButton.translatesAutoresizingMaskIntoConstraints = false
        iconButton.heightAnchor.constraint(equalToConstant: NatSpacing.semi).isActive = true
        iconButton.widthAnchor.constraint(equalToConstant: NatSpacing.semi).isActive = true
        return iconButton
    }()

    private lazy var actionImageTextField: GaYaTextField = {
        let field = GaYaTextField()
        field.title = "Action with image"
        field.type = .text
        field.placeholder = "Image has action on touch"
        field.configure(image: UIImage(named: "ImageAreaLimit")) {
            print("That's the image action")
        }
        field.delegate = self
        return field
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupAction()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapView))
        view.addGestureRecognizer(tapGesture)
    }

    private func setup() {
        title = Self.name

        view.backgroundColor = NatColors.background

        view.addSubview(scrollView)

        scrollView.addSubview(stackView)

        addConstraints()
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(nameField)
        stackView.addArrangedSubview(numberTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(numberPasswordTextField)
        stackView.addArrangedSubview(errorTextField)
        stackView.addArrangedSubview(errorTextFieldMultpleLines)
        stackView.addArrangedSubview(helperTextField)
        stackView.addArrangedSubview(mediumTextField)
        stackView.addArrangedSubview(mediumXTextField)
        stackView.addArrangedSubview(successTextField)
        stackView.addArrangedSubview(longSuccessTextField)
        stackView.addArrangedSubview(requiredTextField)
        stackView.addArrangedSubview(disabledTextField)
        stackView.addArrangedSubview(readOnlyTextField)
        stackView.addArrangedSubview(filledTextField)
        stackView.addArrangedSubview(actionIconTextField)
        stackView.addArrangedSubview(actionImageTextField)
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

    private func setupAction() {
        iconButton.configure(delegate: self) { _ in
            let alert = UIAlertController(title: "Taps",
                                          message: "Icon button tapped",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok",
                                          style: .default,
                                          handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

    @objc func didTapView() {
        view.endEditing(true)
    }
}

extension GaYaTextFieldItemViewController: UITextFieldDelegate {}

