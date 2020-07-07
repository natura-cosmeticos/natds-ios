import NatDS

final class ShortcutItemViewController: UIViewController, SampleItem {
    static var name = "Shortcut"

    // MARK: - Private properties

    private lazy var containedPrimaryStackView = createStackView()
    private lazy var outlinedPrimaryStackView = createStackView()
    private lazy var containedDefaultStackView = createStackView()
    private lazy var outlinedDefaultStackView = createStackView()

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
        view.addSubview(containedDefaultStackView)
        view.addSubview(outlinedPrimaryStackView)
        view.addSubview(outlinedDefaultStackView)

        let containedPrimary = createShortcuts(style: .containedPrimary, text: "Cobranças e títulos")
        containedPrimary.forEach { containedPrimaryStackView.addArrangedSubview($0) }

        let containedDefault = createShortcuts(style: .containedDefault, text: "Contained with default")
        containedDefault.forEach { containedDefaultStackView.addArrangedSubview($0) }

        let outlinedPrimary = createShortcuts(style: .outlinedPrimary, text: "Outlined with primary")
        outlinedPrimary.forEach { outlinedPrimaryStackView.addArrangedSubview($0) }

        let outlinedDefault = createShortcuts(style: .outlinedDefault, text: "Outlined with default")
        outlinedDefault.forEach { outlinedDefaultStackView.addArrangedSubview($0) }

        addConstraints()
    }

    private func createShortcuts(style: NatShortcut.Style, text: String) -> [NatShortcut] {
        var array: [NatShortcut] = []

        (0...3).forEach { element in
            if element == 1 {
                let shortcut = NatShortcut(style: style)
                shortcut.configure(text: "ok")
                array.append(shortcut)
            } else {
                let shortcut = NatShortcut(style: style)
                shortcut.configure(text: text)
                array.append(shortcut)
            }
        }

        return array
    }

    private func createStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = NatSpacing.tiny
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }

    private func addConstraints() {

        let constraints = [
            containedPrimaryStackView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 16
            ),
            containedPrimaryStackView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -24
            ),
            containedPrimaryStackView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 24
            ),
            containedPrimaryStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            containedDefaultStackView.topAnchor.constraint(
                equalTo: containedPrimaryStackView.bottomAnchor,
                constant: 16
            ),
            containedDefaultStackView.widthAnchor.constraint(equalTo: containedPrimaryStackView.widthAnchor),
            containedDefaultStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            outlinedPrimaryStackView.topAnchor.constraint(
                equalTo: containedDefaultStackView.bottomAnchor,
                constant: 16
            ),
            outlinedPrimaryStackView.widthAnchor.constraint(equalTo: containedDefaultStackView.widthAnchor),
            outlinedPrimaryStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            outlinedDefaultStackView.topAnchor.constraint(
                equalTo: outlinedPrimaryStackView.bottomAnchor,
                constant: 16
            ),
            outlinedDefaultStackView.widthAnchor.constraint(equalTo: outlinedPrimaryStackView.widthAnchor),
            outlinedDefaultStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
