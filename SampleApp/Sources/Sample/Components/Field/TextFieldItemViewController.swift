import UIKit
import NatDS
import NatDSIcons

class TextFieldItemViewController: UIViewController, SampleItem {
    static var name: String = "Text Field"

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

    private lazy var textField: TextField = {
        let field = TextField()
        field.title = "Text"
        field.type = .text
        field.placeholder = "Type some text"
        field.delegate = self
        return field
    }()

    private lazy var nameField: TextField = {
        let field = TextField()
        field.title = "Name"
        field.type = .name
        field.placeholder = "Type your name"
        field.delegate = self
        return field
    }()

    private lazy var numberTextField: TextField = {
        let field = TextField()
        field.title = "Number"
        field.type = .number
        field.placeholder = "Type numbers"
        field.delegate = self
        return field
    }()

    private lazy var passwordTextField: TextField = {
        let field = TextField()
        field.title = "Password"
        field.type = .password(keyboardType: .default)
        field.placeholder = "Type your password"
        field.delegate = self
        return field
    }()

    private lazy var numberPasswordTextField: TextField = {
        let field = TextField()
        field.title = "Password - Only numbers"
        field.type = .password(keyboardType: .numberPad)
        field.placeholder = "Type your password (only numbers)"
        field.delegate = self
        field.showVisibilityIcon()
        return field
    }()

    private lazy var errorTextField: TextField = {
        let field = TextField()
        field.title = "Error"
        field.placeholder = "Input with error"
        field.configure(state: .error, with: "Opss... this input has an error!")
        field.delegate = self
        return field
    }()

    private lazy var errorTextFieldMultpleLines: TextField = {
        let field = TextField()
        field.title = "Error"
        field.placeholder = "Input with error"
        field.configure(state: .error,
                        with: "Opss... this input has an error - Neque porro quisquam est qui dolorem ipsum quia dolor sit amet.")
        field.delegate = self
        return field
    }()

    private lazy var helperTextField: TextField = {
        let field = TextField()
        field.title = "Helper"
        field.placeholder = "Input with helper"
        field.helper = "This input has a helper text"
        field.delegate = self
        return field
    }()

    private lazy var mediumTextField: TextField = {
        let field = TextField()
        field.configure(size: .medium)
        field.title = "Medium Size"
        field.type = .text
        field.placeholder = "A text field with height size medium"
        field.delegate = self
        return field
    }()

    private lazy var mediumXTextField: TextField = {
        let field = TextField()
        field.configure(size: .mediumX)
        field.title = "MediumX Size (Default)"
        field.type = .text
        field.placeholder = "A text field with height size mediumX"
        field.delegate = self
        return field
    }()

    private lazy var successTextField: TextField = {
        let field = TextField()
        field.title = "Success"
        field.type = .text
        field.placeholder = "Input with success"
        field.configure(state: .success, with: "Success message validating what's typed.")
        field.delegate = self
        return field
    }()

    private lazy var longSuccessTextField: TextField = {
        let field = TextField()
        field.title = "Success"
        field.type = .text
        field.placeholder = "Input with success"
        field.configure(state: .success,
                        with: "A very, very long success message validating what's typed and giving more info.")
        field.delegate = self
        return field
    }()

    private lazy var requiredTextField: TextField = {
        let field = TextField()
        field.title = "Required"
        field.type = .text
        field.placeholder = "This text field is required"
        field.configure(required: true)
        field.delegate = self
        return field
    }()

    private lazy var disabledTextField: TextField = {
        let field = TextField()
        field.title = "Disabled"
        field.type = .text
        field.placeholder = "Disabled input"
        field.delegate = self
        field.configure(isEnabled: false)
        return field
    }()

    private lazy var readOnlyTextField: TextField = {
        let field = TextField()
        field.title = "Read only"
        field.type = .text
        field.text = "Input is read-only"
        field.delegate = self
        field.configure(readOnly: true)
        return field
    }()

    private lazy var filledTextField: TextField = {
        let field = TextField()
        field.title = "Filled"
        field.type = .text
        field.text = "Filled text field"
        field.delegate = self
        return field
    }()

    private lazy var actionIconTextField: TextField = {
        let field = TextField()
        field.title = "Action with icon"
        field.type = .text
        field.placeholder = "Icon has action on touch"
        field.configure(icon: getIcon(.outlinedDefaultMockup)) {
            print("That's the icon action")
        }
        field.delegate = self
        return field
    }()

    private lazy var actionImageTextField: TextField = {
        let field = TextField()
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

    @objc func didTapView() {
        view.endEditing(true)
    }
}

extension TextFieldItemViewController: TextFieldDelegate {}
