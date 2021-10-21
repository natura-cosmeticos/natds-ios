import NatDS

class ExpansionPanelViewController: UIViewController, SampleItem {

    static var name: String = "Expansion Panel"
    var tapsCounter: Int = 0
    var expandCounter: Int = 0

    private lazy var panel: ExpansionPanel = {
        let expansionPanel = ExpansionPanel()
        expansionPanel.setSubtitle("Subtitle")
        expansionPanel.translatesAutoresizingMaskIntoConstraints = false
        return expansionPanel
    }()

    private lazy var secondPanel: ExpansionPanel = {
        let expansionPanel = ExpansionPanel()
        expansionPanel.setSubtitle("Subtitle 2")
        expansionPanel.translatesAutoresizingMaskIntoConstraints = false
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

    private lazy var secondeDetail: NatImage = {
        let image = NatImage()
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupPanels()
    }

    private func setupLayout() {
        title = Self.name
        view.backgroundColor = NatColors.background
        view.addSubview(panel)
        view.addSubview(secondPanel)

        let safeArea = view.safeAreaLayoutGuide
        let horizontalMargin = ExpansionPanel.Margin.horizontalMargin
        NSLayoutConstraint.activate([
            panel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: NatSpacing.tiny),
            panel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: horizontalMargin),
            panel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -horizontalMargin),
            secondPanel.topAnchor.constraint(equalTo: panel.bottomAnchor, constant: NatSpacing.tiny),
            secondPanel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: horizontalMargin),
            secondPanel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -horizontalMargin)
        ])
    }

    private func setupPanels() {
        panel.setDetailView(detail)
        secondPanel.setDetailView(secondeDetail)
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
