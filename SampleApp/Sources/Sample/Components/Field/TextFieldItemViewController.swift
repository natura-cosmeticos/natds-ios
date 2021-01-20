import UIKit
import NatDS

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
        stack.distribution = .equalSpacing
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
        field.title = "Number password"
        field.type = .password(keyboardType: .numberPad)
        field.placeholder = "Type your password (only numbers)"
        field.delegate = self
        field.showVisibilityIcon(true)
        return field
    }()

    private lazy var errorTextField: TextField = {
        let field = TextField()
        field.title = "Error"
        field.placeholder = "Input with error"
        field.error = "Opss... this input has an error"
        field.delegate = self
        return field
    }()

    private lazy var errorTextFieldMultpleLines: TextField = {
        let field = TextField()
        field.title = "Error"
        field.placeholder = "Input with error"
        field.error = "Opss... this input has an error - Neque porro quisquam est qui dolorem ipsum quia dolor sit amet"
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
