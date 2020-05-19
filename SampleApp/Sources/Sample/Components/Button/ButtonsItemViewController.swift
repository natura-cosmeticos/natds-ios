import NatDS

class ButtonsItemViewController: UIViewController, SampleItem {
    static var name = "Button"

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .fillEqually
        return stack
    }()

    private lazy var containedButton: ContainedButton = {
        let button = ContainedButton()
        button.setTitle("Contained Button", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        return button
    }()

    private lazy var disabledContainedButton: ContainedButton = {
        let button = ContainedButton()
        button.setTitle("Disabled contained Button", for: .normal)
        button.isEnabled = false
        return button
    }()

    private lazy var flatButton: FlatButton = {
        let button = FlatButton()
        button.setTitle("Tertiary Button", for: .normal)
        return button
    }()

    private lazy var disabledFlatButton: FlatButton = {
        let button = FlatButton()
        button.setTitle("Disabled Tertiary Button", for: .normal)
        button.isEnabled = false
        return button
    }()

    private let outlinedButton: NatButton = {
        let button = NatButton(style: .outlined)
        button.configure(title: "Outlined Button")
        return button
    }()

    private let disableOutlinedButton: NatButton = {
        let button = NatButton(style: .outlined)
        button.configure(title: "Disabled Outlined Button")
        button.isEnabled = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Self.name
        setup()
    }

    private func setup() {
        view.backgroundColor = NatColors.background

        addStackView()
        stackView.addArrangedSubview(containedButton)
        stackView.addArrangedSubview(disabledContainedButton)
        stackView.addArrangedSubview(flatButton)
        stackView.addArrangedSubview(disabledFlatButton)
        stackView.addArrangedSubview(outlinedButton)
        stackView.addArrangedSubview(disableOutlinedButton)
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
}
