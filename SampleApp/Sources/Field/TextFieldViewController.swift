import UIKit
import NatDS

class TextFieldViewController: UIViewController {

    private let textField = TextField()

    private let numberTextField = TextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        title = "TextField"

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapView))
        view.addGestureRecognizer(tapGesture)
    }

    private func setup() {
        view.backgroundColor = .white

        let backButton = UIBarButtonItem()
        backButton.title = "Sample App"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton

        addTextField()

        textField.title = "Name"
        textField.placeholder = "Type your name"
        textField.delegate = self

        numberTextField.title = "Document Id"
        numberTextField.placeholder = "Type your document id"
        numberTextField.helper = "Only numbers."
        numberTextField.type = .number
        numberTextField.delegate = self
    }

    private func addTextField() {

        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ]

        NSLayoutConstraint.activate(constraints)

        view.addSubview(numberTextField)
        numberTextField.translatesAutoresizingMaskIntoConstraints = false

        let numberTextFieldConstraints = [
            numberTextField.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16),
            numberTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            numberTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ]

        NSLayoutConstraint.activate(numberTextFieldConstraints)
    }

    @objc func didTapView() {
        view.endEditing(true)
    }
}

extension TextFieldViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {

        if numberTextField.equals(textField: textField) {
            let expectedText = (textField.text ?? "")
            let text = expectedText.filter { !"0123456789".contains($0) }

            if !text.isEmpty {
                self.numberTextField.error = "Opss... only numbers are accepted."
            } else {
                self.numberTextField.error = nil
            }
        }

        return true
    }
}
