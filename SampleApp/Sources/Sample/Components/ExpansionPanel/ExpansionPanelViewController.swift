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
        label.textColor = NatColors.onSurface
        label.font = NatFonts.font(ofSize: .body1, withWeight: .regular)
        return label
    }()
    // swiftlint:enable line_length
    
    // TESTING FOR BUGS
    private lazy var secondPanel: ExpansionPanel = {
        let expansionPanel = ExpansionPanel()
        expansionPanel.setSubtitle("Second subtitle")
        return expansionPanel
    }()
    
    private lazy var secondDetail: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        title = Self.name
        view.backgroundColor = NatColors.background
        view.addSubview(panel)
        panel.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = view.safeAreaLayoutGuide
        let horizontalMargin = ExpansionPanel.Margin.horizontalMargin
        NSLayoutConstraint.activate([
            panel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: NatSpacing.tiny),
            panel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: horizontalMargin),
            panel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -horizontalMargin)
        ])
        panel.setDetailView(detail)
        
        view.addSubview(secondPanel)
        secondPanel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondDetail.heightAnchor.constraint(equalToConstant: 50),
            secondDetail.widthAnchor.constraint(equalToConstant: 100),
            secondPanel.topAnchor.constraint(equalTo: panel.bottomAnchor, constant: NatSpacing.tiny),
            secondPanel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: horizontalMargin),
            secondPanel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -horizontalMargin)
        ])
        secondPanel.setDetailView(secondDetail)
    }

}
