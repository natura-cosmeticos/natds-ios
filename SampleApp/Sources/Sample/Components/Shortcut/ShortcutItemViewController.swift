import NatDS

final class ShortcutItemViewController: UIViewController, SampleItem {
    static var name = "Shortcut"

    // MARK: - Private properties

    private lazy var containedPrimaryStackView = createStackView()
    private lazy var outlinedPrimaryStackView = createStackView()

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

        view.addSubview(containedPrimaryStackView)
        view.addSubview(outlinedPrimaryStackView)

        let containedPrimary = createShortcuts(style: .containedPrimary, text: "Contained / Primary")
        containedPrimary.forEach { containedPrimaryStackView.addArrangedSubview($0) }

        let outlinedPrimary = createShortcuts(style: .outlinedPrimary, text: "Outlined / Primary")
        outlinedPrimary.forEach { outlinedPrimaryStackView.addArrangedSubview($0) }

        addConstraints()
    }

    private func createShortcuts(style: NatShortcut.Style, text: String) -> [NatShortcut] {
        var array: [NatShortcut] = []

        (0...3).forEach { _ in
            let shortcut = NatShortcut(style: style)
            shortcut.configure(text: text)
            array.append(shortcut)
        }

        return array
    }

    private func createStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }

    private func addConstraints() {

        let constraints = [
            containedPrimaryStackView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: NatSpacing.small
            ),
            containedPrimaryStackView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -NatSpacing.standart
            ),
            containedPrimaryStackView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: NatSpacing.standart
            ),
            containedPrimaryStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            outlinedPrimaryStackView.topAnchor.constraint(
                equalTo: containedPrimaryStackView.bottomAnchor,
                constant: NatSpacing.small
            ),
            outlinedPrimaryStackView.widthAnchor.constraint(equalTo: containedPrimaryStackView.widthAnchor),
            outlinedPrimaryStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
