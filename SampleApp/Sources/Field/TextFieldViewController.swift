import UIKit
import NatDS

class TextFieldViewController: UIViewController {

    private let textField = TextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        title = "TextField"

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapView))
        view.addGestureRecognizer(tapGesture)
    }

    private func setup() {
        view.backgroundColor = .white
        addTextField()

        textField.info = "CPF"
        textField.placeholder = "Digite o nº do CPF"
        textField.helper = "Digite apenas os números"
        textField.delegate = self
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
    }

    @objc func didTapView() {
        textField.resignFirstResponder()
    }
}

extension TextFieldViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {

        let expectedText = (textField.text ?? "")
        let text = expectedText.filter { !"0123456789".contains($0) }

        if !text.isEmpty {
            self.textField.error = "Opss... somente números são aceitos"
        } else {
            self.textField.error = nil
        }

        return true
    }
}
