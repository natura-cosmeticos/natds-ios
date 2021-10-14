import NatDS

class ExpansionPanelViewController: UIViewController, SampleItem {

    static var name: String = "Expansion Panel"
    var tapsCounter: Int = 0
    var expandCounter: Int = 0

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
        panel.setHandlerForTap(withAction: .allActions) {
            self.tapsCounter += 1
            print("This component was tapped \(self.tapsCounter) times")
        }
        panel.setHandlerForTap(withAction: .expand) {
            self.expandCounter += 1
            print("This component was expanded \(self.expandCounter) times")
        }
    }

}
