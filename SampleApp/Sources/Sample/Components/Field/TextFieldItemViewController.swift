import UIKit
import NatDS

class TextFieldItemViewController: UIViewController, SampleItem {
    static var name: String = "Text Fields"

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

    private lazy var errorTextField: TextField = {
        let field = TextField()
        field.title = "Error"
        field.placeholder = "Input with error"
        field.error = "Opss... this input has an error"
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
        view.backgroundColor = .white

        addStackView()
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(nameField)
        stackView.addArrangedSubview(numberTextField)
        stackView.addArrangedSubview(errorTextField)
        stackView.addArrangedSubview(helperTextField)
    }

    private func addStackView() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    @objc func didTapView() {
        view.endEditing(true)
    }
}

extension TextFieldItemViewController: TextFieldDelegate {

}
