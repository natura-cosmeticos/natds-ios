import NatDS

class ButtonsItemViewControllerN: UIViewController, SampleItem {
    static var name = "Button N"

    private let outlinedButton: NatButton = {
        let button = NatButton(style: .outlined)
        button.configure(title: "Outlined")
        return button
    }()

    private let disableOutlinedButton: NatButton = {
        let button = NatButton(style: .outlined)
        button.configure(title: "Outlined")
        button.isEnabled = false
        return button
    }()

    private let outlinedFullButton: NatButton = {
        let button = NatButton(style: .outlined)
        button.configure(title: "Outlined")
        return button
    }()

    private let disableOutlinedFullButton: NatButton = {
        let button = NatButton(style: .outlined)
        button.configure(title: "Disabled Outlined")
        button.isEnabled = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Self.name
        setup()

//        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
//            self.outlinedButton.configure(height: .medium)
//        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 6.5) {
            self.outlinedButton.isEnabled = false
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 12.5) {
            self.outlinedButton.isEnabled = true
        }
    }

    private func setup() {
        view.backgroundColor = NatColors.background

        view.addSubview(outlinedButton)
        view.addSubview(disableOutlinedButton)
        view.addSubview(outlinedFullButton)
        view.addSubview(disableOutlinedFullButton)
        addConstraints()
    }

    private func addConstraints() {
//        stackView.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            outlinedButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            outlinedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            outlinedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            disableOutlinedButton.topAnchor.constraint(equalTo: outlinedButton.bottomAnchor, constant: 16),
            disableOutlinedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

            outlinedFullButton.topAnchor.constraint(equalTo: disableOutlinedButton.bottomAnchor, constant: 16),
            outlinedFullButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            outlinedFullButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            disableOutlinedFullButton.topAnchor.constraint(equalTo: outlinedFullButton.bottomAnchor, constant: 16),
            disableOutlinedFullButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            disableOutlinedFullButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
