import NatDS

class ExpansionPanelViewController: UIViewController, SampleItem {

    static var name: String = "Expansion Panel"

    private lazy var panel: ExpansionPanel = {
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
        label.font = NatFonts.font(ofSize: .body1, withWeight: .regular)
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
        view.addSubview(panel)
        panel.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            panel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: ExpansionPanel.Margin.top),
            panel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: ExpansionPanel.Margin.left),
            panel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -ExpansionPanel.Margin.right)
        ])
        panel.setDetailView(detail)
    }

}
