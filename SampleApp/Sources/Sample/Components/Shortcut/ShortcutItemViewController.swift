import NatDS

final class ShortcutItemViewController: UIViewController, SampleItem {
    static var name = "Shortcut"

    // MARK: - Private properties

    private let shortcut: NatShortcut = {
        let shorcut = NatShortcut()
        shorcut.translatesAutoresizingMaskIntoConstraints = false
        return shorcut
    }()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = Self.name

        setup()
    }

    // MARK: - Actions

    // MARK: - Private methods

    private func setup() {
        view.backgroundColor = NatColors.background
        view.addSubview(shortcut)

        addConstraints()
    }

    private func addConstraints() {

        let constraints = [
            shortcut.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shortcut.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            shortcut.widthAnchor.constraint(equalToConstant: 100),
//            shortcut.heightAnchor.constraint(equalToConstant: 100),
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
