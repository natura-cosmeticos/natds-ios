import NatDS

class ExpansionPanelViewController: UIViewController, SampleItem {
    var panelHeightConstraint: NSLayoutConstraint?

    static var name: String = "Expansion Panel"
    var tapsCounter: Int = 0
    var expandCounter: Int = 0

    private lazy var panel: ExpansionPanel = {
        let expansionPanel = ExpansionPanel()
        expansionPanel.setSubtitle("Panel with custom animation")
        expansionPanel.translatesAutoresizingMaskIntoConstraints = false
        return expansionPanel
    }()

    private lazy var secondPanel: ExpansionPanel = {
        let expansionPanel = ExpansionPanel()
        expansionPanel.setSubtitle("Panel with default animation")
        expansionPanel.translatesAutoresizingMaskIntoConstraints = false
        return expansionPanel
    }()

    private lazy var thirdPanel: ExpansionPanel = {
        let expansionPanel = ExpansionPanel()
        expansionPanel.setSubtitle("Panel with handler for taps")
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

    private lazy var secondDetail: NatLogo = {
        let logo = NatLogo()
        logo.configure(model: .modelB)
        return logo
    }()

    private lazy var thirdDetail: UILabel = {
        let label = UILabel()
        label.text = "Simple text inside the component."
        label.numberOfLines = 0
        label.textColor = NatColors.onSurface
        label.font = NatFonts.font(ofSize: .body1, withWeight: .regular)
        return label
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
        view.addSubview(thirdPanel)
//        panel.translatesAutoresizingMaskIntoConstraints = false

        let safeArea = view.safeAreaLayoutGuide
        let horizontalMargin = ExpansionPanel.Margin.horizontalMargin
        panelHeightConstraint = panel.heightAnchor.constraint(equalToConstant: 56)
        panelHeightConstraint?.isActive = true

        NSLayoutConstraint.activate([
            panel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: NatSpacing.tiny),
            panel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: horizontalMargin),
            panel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -horizontalMargin),
            secondPanel.topAnchor.constraint(equalTo: panel.bottomAnchor, constant: NatSpacing.tiny),
            secondPanel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: horizontalMargin),
            secondPanel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -horizontalMargin),
            thirdPanel.topAnchor.constraint(equalTo: secondPanel.bottomAnchor, constant: NatSpacing.tiny),
            thirdPanel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: horizontalMargin),
            thirdPanel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -horizontalMargin)
        ])
    }

    private func setupPanels() {
        // detail views
        panel.setDetailView(detail)
        secondPanel.setDetailView(secondDetail)
        thirdPanel.setDetailView(thirdDetail)

        // custom animations
        panel.setCustomAnimationForExpand {
            UIView.animate(withDuration: 1) {
                self.panelHeightConstraint?.constant = 250
                self.view.layoutIfNeeded()
            }
        }
        panel.setCustomAnimationForCollapse {
            UIView.animate(withDuration: 1) {
                self.panelHeightConstraint?.constant = 56
                self.view.layoutIfNeeded()
            }
        }

        // handler for taps
        thirdPanel.setHandlerForTap(withAction: .allActions) {
            self.tapsCounter += 1
            print("This component was tapped \(self.tapsCounter) times")
        }
        thirdPanel.setHandlerForTap(withAction: .expand) {
            self.expandCounter += 1
            print("This component was expanded \(self.expandCounter) times")
        }
    }
}
