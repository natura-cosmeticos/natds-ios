import UIKit
import NatDS

class NatSelectItemViewController: UIViewController, SampleItem {
    static var name: String = "Select"

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

    private lazy var standardSelect: NatSelect = {
        let field = TextField(theme: .avonLight)
        field.title = "Standard select"
        field.type = .text
        field.placeholder = "Select an item"
        let select = NatSelect(textField: field)
        select.configure(data: ["Item 1", "Item 2"])
        return select
    }()

    private lazy var formattedSelect: NatSelect = {
        let field = TextField()
        field.title = "Formatted select"
        field.type = .text
        field.placeholder = "Select an item"
        let select = NatSelect(textField: field)
        select.configure(data: ["Item 1", "Item 2"])
        select.configure(format: "Selected: %@")
        return select
    }()

    private lazy var multipleComponentsWithFormatSelect: NatSelect = {
        let field = TextField()
        field.title = "Multiple components with format select"
        field.type = .text
        field.placeholder = "Select two items"
        let select = NatSelect(textField: field)
        select.configure(data: [0: ["Item 1", "Item 2"],
                                1: ["Item 3", "Item 4"]])
        select.configure(format: "First: %@, second: %@")
        return select
    }()

    private lazy var errorSelect: NatSelect = {
        let field = TextField()
        field.title = "Error"
        field.placeholder = "Input with error"
        field.configure(state: .error, with: "Opss... this input has an error!")
        let select = NatSelect(textField: field)
        select.configure(data: ["Item 1", "Item 2"])
        return select
    }()

    // swiftlint:disable line_length
    private lazy var errorSelectMultipleLines: NatSelect = {
        let field = TextField()
        field.title = "Error"
        field.placeholder = "Input with error"
        field.configure(state: .error,
                        with: "Opss... this input has an error - Neque porro quisquam est qui dolorem ipsum quia dolor sit amet.")
        let select = NatSelect(textField: field)
        select.configure(data: ["Item 1", "Item 2"])
        return select
    }()
    // swiftlint:enable line_length

    private lazy var helperSelect: NatSelect = {
        let field = TextField()
        field.title = "Helper"
        field.placeholder = "Input with helper"
        field.helper = "This input has a helper text"
        let select = NatSelect(textField: field)
        select.configure(data: ["Item 1", "Item 2"])
        return select
    }()

    private lazy var mediumSelect: NatSelect = {
        let field = TextField()
        field.configure(size: .medium)
        field.title = "Medium Size"
        field.type = .text
        field.placeholder = "A select with height size medium"
        let select = NatSelect(textField: field)
        select.configure(data: ["Item 1", "Item 2"])
        return select
    }()

    private lazy var mediumXSelect: NatSelect = {
        let field = TextField()
        field.configure(size: .mediumX)
        field.title = "MediumX Size (Default)"
        field.type = .text
        field.placeholder = "A select with height size mediumX"
        let select = NatSelect(textField: field)
        select.configure(data: ["Item 1", "Item 2"])
        return select
    }()

    private lazy var successSelect: NatSelect = {
        let field = TextField()
        field.title = "Success"
        field.type = .text
        field.placeholder = "Input with success"
        field.configure(state: .success, with: "Success message validating what's typed.")
        let select = NatSelect(textField: field)
        select.configure(data: ["Item 1", "Item 2"])
        return select
    }()

    private lazy var longSuccessSelect: NatSelect = {
        let field = TextField()
        field.title = "Success"
        field.type = .text
        field.placeholder = "Input with success"
        field.configure(state: .success,
                        with: "A very, very long success message validating what's typed and giving more info.")
        let select = NatSelect(textField: field)
        select.configure(data: ["Item 1", "Item 2"])
        return select
    }()

    private lazy var requiredSelect: NatSelect = {
        let field = TextField()
        field.title = "Required"
        field.type = .text
        field.placeholder = "This select is required"
        field.configure(required: true)
        let select = NatSelect(textField: field)
        select.configure(data: ["Item 1", "Item 2"])
        return select
    }()

    private lazy var disabledSelect: NatSelect = {
        let field = TextField()
        field.title = "Disabled"
        field.type = .text
        field.placeholder = "Disabled input"
        field.configure(isEnabled: false)
        let select = NatSelect(textField: field)
        select.configure(data: ["Item 1", "Item 2"])
        return select
    }()

    private lazy var readOnlySelect: NatSelect = {
        let field = TextField()
        field.title = "Read only"
        field.type = .text
        field.text = "Input is read-only"
        field.configure(readOnly: true)
        let select = NatSelect(textField: field)
        select.configure(data: ["Item 1", "Item 2"])
        return select
    }()

    private lazy var filledSelect: NatSelect = {
        let field = TextField()
        field.title = "Filled"
        field.type = .text
        field.text = "Filled select"
        let select = NatSelect(textField: field)
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
