import NatDS

final class IconButtonItemViewController: UIViewController, SampleItem {
    static var name = "IconButton"

    // MARK: - Private properties

    private let iconButton: NatIconButton = {
        let iconButton = NatIconButton()
        iconButton.translatesAutoresizingMaskIntoConstraints = false

        return iconButton
    }()

    // MARK: - Life cycle

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
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

    private func createStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }

    private func addConstraints() {
        let circleSize = NatSizes.largeX

        let constraints = [
            iconButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            iconButton.heightAnchor.constraint(equalToConstant: circleSize),
            iconButton.widthAnchor.constraint(equalToConstant: circleSize)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
