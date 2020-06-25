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
        label.text = "As for the Hobbits of the Shire, with whom these tales are concerned, in the days of their peace and prosperity they were a merry folk. They dressed in bright colors, being notably fond of yellow and green; but they seldom wore shoes, since their feet had tough leathery soles and were clad in a thick curling hair, much like the hair of their heads, which was commonly brown."
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
