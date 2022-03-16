import NatDS
import NatDSIcons

final class ShortcutItemViewController: UIViewController, SampleItem {
    static var name = "Shortcut"

    // MARK: - Private properties

    private lazy var containedStackView = createStackView()
    private lazy var outlinedStackView = createStackView()
    private lazy var otherConfigStackView = createStackView()

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
        setupShortcuts()
        addStackViews()
        addConstraints()
    }

    private func setupShortcuts() {
        // Contained
        let containedPrimaryShortcut = NatShortcut(style: .contained, color: .primary,
                                                   text: "Contained Primary", icon: getIcon(.filledActionAdd))
        let containedNeutralShortcut = NatShortcut(style: .contained, color: .neutral,
                                                   text: "Contained Neutral", icon: getIcon(.outlinedAlertCheck))
        let containedDisabledShortcut = NatShortcut(style: .contained,
                                                    text: "Contained Disabled", icon: getIcon(.filledMediaPause))
        containedDisabledShortcut.configure(state: .disabled)
        containedPrimaryShortcut.configureText(numberOfLines: 1, lineBreakMode: .byTruncatingTail)
        containedNeutralShortcut.configureText(numberOfLines: 1, lineBreakMode: .byTruncatingTail)
        containedDisabledShortcut.configureText(numberOfLines: 1, lineBreakMode: .byTruncatingTail)

        // Outlined
        let outlinedPrimaryShortcut = NatShortcut(style: .outlined, color: .primary,
                                                  text: "Outlined Primary", icon: getIcon(.outlinedAlertInfo))
        let outlinedNeutralShortcut = NatShortcut(style: .outlined, color: .neutral,
                                                  text: "Outlined Neutral", icon: getIcon(.filledPlaceTruck))
        let outlinedDisabledShortcut = NatShortcut(style: .outlined,
                                                   text: "Outlined Disabled", icon: getIcon(.outlinedPlaceRocket))
        outlinedDisabledShortcut.configure(state: .disabled)

        // Other configurations
        let containedBadgeShortcut = NatShortcut(style: .outlined, color: .primary,
                                                 text: "Notify with badge", icon: getIcon(.filledProductBrandsproduct))
        let longTextNoBreakLineShorcut = NatShortcut(style: .contained, color: .primary,
                                                     text: "Long text with one line only",
                                                     icon: getIcon(.outlinedActionDownload))
        let longTextBreakLineShortcut = NatShortcut(style: .contained, color: .primary,
                                                    text: "Long text with custom break line",
                                                    icon: getIcon(.filledNavigationMenu))
        longTextBreakLineShortcut.configureText(numberOfLines: 3, lineBreakMode: .byWordWrapping)
        longTextNoBreakLineShorcut.configureText(numberOfLines: 1, lineBreakMode: .byTruncatingTail)

        let badge = NatBadge(style: .standard, color: .alert)
        badge.configure(count: 99)
        containedBadgeShortcut.configure(badge: badge)

        // Setup stack views
        containedStackView.addArrangedSubview(containedPrimaryShortcut)
        containedStackView.addArrangedSubview(containedNeutralShortcut)
        containedStackView.addArrangedSubview(containedDisabledShortcut)
        outlinedStackView.addArrangedSubview(outlinedPrimaryShortcut)
        outlinedStackView.addArrangedSubview(outlinedNeutralShortcut)
        outlinedStackView.addArrangedSubview(outlinedDisabledShortcut)
        otherConfigStackView.addArrangedSubview(containedBadgeShortcut)
        otherConfigStackView.addArrangedSubview(longTextNoBreakLineShorcut)
        otherConfigStackView.addArrangedSubview(longTextBreakLineShortcut)
    }

    private func addStackViews() {
        view.addSubview(containedStackView)
        view.addSubview(outlinedStackView)
        view.addSubview(otherConfigStackView)
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
            // Contained
            containedStackView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: NatSpacing.small
            ),
            containedStackView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -NatSpacing.standard
            ),
            containedStackView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: NatSpacing.standard
            ),
            containedStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            // Outlined primary
            outlinedStackView.topAnchor.constraint(
                equalTo: containedStackView.bottomAnchor,
                constant: NatSpacing.small
            ),
            outlinedStackView.widthAnchor.constraint(equalTo: containedStackView.widthAnchor),
            outlinedStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            otherConfigStackView.topAnchor.constraint(
                equalTo: outlinedStackView.bottomAnchor,
                constant: NatSpacing.small
            ),
            otherConfigStackView.widthAnchor.constraint(equalTo: containedStackView.widthAnchor),
            otherConfigStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
