import NatDS

class ButtonsItemViewController: UIViewController, SampleItem {
    static var name = "Buttons"

    private lazy var containedButton: ContainedButton = {
        let button = ContainedButton()
        button.setTitle("Contained Button", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Self.name
        setup()
    }

    private func setup() {
        view.backgroundColor = .white
        view.addSubview(containedButton)
        containedButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containedButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containedButton.heightAnchor.constraint(equalToConstant: 40),
            containedButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}
