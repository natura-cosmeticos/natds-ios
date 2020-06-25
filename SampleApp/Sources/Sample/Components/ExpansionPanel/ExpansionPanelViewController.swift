import NatDS

class ExpansionPanelViewController: UIViewController, SampleItem {

    static var name: String = "Expansion Panel"

    private lazy var expansionPanel: ExpansionPanel = {
        let expansionPanel = ExpansionPanel()
        expansionPanel.setSubtitle("Subtitle")
        return expansionPanel
    }()

    // swiftlint:disable line_length
    private lazy var detail: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        label.numberOfLines = 0
        label.textColor = NatColors.highEmphasis
        label.font = Fonts.body1
        return label
    }()
    // swiftlint:enable line_length

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        title = Self.name
        view.backgroundColor = NatColors.surface
        view.addSubview(expansionPanel)
        expansionPanel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            expansionPanel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 8),
            expansionPanel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 16),
            expansionPanel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -16)
        ])
        expansionPanel.setDetailView(detail)
    }

}
