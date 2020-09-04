import NatDS

final class IconButtonItemViewController: UIViewController, SampleItem {
    static var name = "IconButton"

    // MARK: - Private properties

    private let iconButton: NatIconButton = {
        let iconButton = NatIconButton(style: .standardPrimary)
        iconButton.translatesAutoresizingMaskIntoConstraints = false

        return iconButton
    }()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = Self.name

        setup()
    }

    // MARK: - Private methods

    private func setup() {
        view.backgroundColor = NatColors.background

        view.addSubview(iconButton)

        addConstraints()
    }

    private func addConstraints() {
        let circleSize: CGFloat = NatIconButton.Sizes.semiX

        let constraints = [
            iconButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            iconButton.heightAnchor.constraint(equalToConstant: circleSize),
            iconButton.widthAnchor.constraint(equalToConstant: circleSize)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
