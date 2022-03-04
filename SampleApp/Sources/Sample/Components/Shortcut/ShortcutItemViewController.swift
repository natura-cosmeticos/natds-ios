import NatDS

final class ShortcutItemViewController: UIViewController, SampleItem {
    static var name = "Shortcut"

    // MARK: - Private properties

    private lazy var containedPrimaryStackView = createStackView()
    private lazy var outlinedPrimaryStackView = createStackView()
    private lazy var containedPrimaryBadgeStackView = createStackView()
    private lazy var outlinedPrimaryBadgeStackView = createStackView()

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
        view.addSubview(containedPrimaryBadgeStackView)
        view.addSubview(outlinedPrimaryBadgeStackView)

        let containedPrimary = createShortcuts(style: .contained,
                                               color: .primary,
                                               text: "Contained Primary",
                                               shouldBreakLine: true)
        containedPrimary.forEach { containedPrimaryStackView.addArrangedSubview($0) }

        let outlinedPrimary = createShortcuts(style: .outlined,
                                              color: .primary,
                                              text: "Outlined Primary",
                                              shouldBreakLine: true)
        outlinedPrimary.forEach { outlinedPrimaryStackView.addArrangedSubview($0) }

        let containedDefaultBadge = createShortcuts(style: .contained,
                                                    color: .neutral,
                                                    text: "Contained Default",
                                                    shouldShowBadge: true,
                                                    shouldBreakLine: true)
        containedDefaultBadge.forEach { containedPrimaryBadgeStackView.addArrangedSubview($0) }

        let outlinedDefaultBadge = createShortcuts(style: .outlined,
                                                   color: .neutral,
                                                   text: "Outlined Default",
                                                   shouldShowBadge: true,
                                                   shouldBreakLine: true)
        outlinedDefaultBadge.forEach { outlinedPrimaryBadgeStackView.addArrangedSubview($0) }

        addConstraints()
    }

    private func createShortcuts(style: NatShortcut.Style,
                                 color: NatShortcut.Color,
                                 text: String,
                                 shouldShowBadge: Bool = false,
                                 shouldBreakLine: Bool = false) -> [NatShortcut] {
        (0...3).map { value in
            let shortcut = NatShortcut(style: style, color: color, text: text)

            if shouldShowBadge {
                let badgeValues = [1, 25, 99, 100]
                let badge = NatBadge(style: .standard, color: .alert)
                badge.configure(count: badgeValues[value])
                shortcut.configure(badge: badge)
            }

            if shouldBreakLine {
                shortcut.configureText(numberOfLines: 0, lineBreakMode: .byWordWrapping)
            } else {
                shortcut.configureText(numberOfLines: 1, lineBreakMode: .byTruncatingTail)
            }

            return shortcut
        }
    }

    private func createStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = NatSpacing.tiny
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
                constant: -NatSpacing.standard
            ),
            containedPrimaryStackView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: NatSpacing.standard
            ),
            containedPrimaryStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            outlinedPrimaryStackView.topAnchor.constraint(
                equalTo: containedPrimaryStackView.bottomAnchor,
                constant: NatSpacing.small
            ),
            outlinedPrimaryStackView.widthAnchor.constraint(equalTo: containedPrimaryStackView.widthAnchor),
            outlinedPrimaryStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            containedPrimaryBadgeStackView.topAnchor.constraint(
                equalTo: outlinedPrimaryStackView.bottomAnchor,
                constant: NatSpacing.small
            ),
            containedPrimaryBadgeStackView.widthAnchor.constraint(equalTo: containedPrimaryStackView.widthAnchor),
            containedPrimaryBadgeStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            outlinedPrimaryBadgeStackView.topAnchor.constraint(
                equalTo: containedPrimaryBadgeStackView.bottomAnchor,
                constant: NatSpacing.small
            ),
            outlinedPrimaryBadgeStackView.widthAnchor.constraint(equalTo: containedPrimaryStackView.widthAnchor),
            outlinedPrimaryBadgeStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
