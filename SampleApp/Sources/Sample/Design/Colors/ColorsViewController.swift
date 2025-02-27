import NatDS

final class ColorsViewController: UIViewController, SampleItem {
    static var name = "Color"

    private let sections = [
        "Primary",
        "Secondary",
        "Surface",
        "Content",
        "Feedback"
    ]

    private let cellsViewModel: [String: [ColorsCell.ViewModel]] = [
        "Primary": [
            ColorsCell.ViewModel(colorName: "primary", color: NatColors.primary, onColor: NatColors.onPrimary, isTextOnHidden: false),
            ColorsCell.ViewModel(colorName: "primaryLight", color: NatColors.primaryLight, onColor: NatColors.onPrimaryLight, isTextOnHidden: false),
            ColorsCell.ViewModel(colorName: "primaryDark", color: NatColors.primaryDark, onColor: NatColors.onPrimaryDark, isTextOnHidden: false)
        ],
        "Secondary": [
            ColorsCell.ViewModel(colorName: "secondary", color: NatColors.secondary, onColor: NatColors.onSecondary, isTextOnHidden: false),
            ColorsCell.ViewModel(colorName: "secondaryLight", color: NatColors.secondaryLight, onColor: NatColors.onSecondaryLight, isTextOnHidden: false),
            ColorsCell.ViewModel(colorName: "secondaryDark", color: NatColors.secondaryDark, onColor: NatColors.onSecondaryDark, isTextOnHidden: false)
        ],
        "Surface": [
            ColorsCell.ViewModel(colorName: "background", color: NatColors.background, onColor: NatColors.onBackground, isTextOnHidden: false),
            ColorsCell.ViewModel(colorName: "surface", color: NatColors.surface, onColor: NatColors.onSurface, isTextOnHidden: false)
        ],
        "Content": [
            ColorsCell.ViewModel(colorName: "highlight", color: NatColors.highlight, onColor: NatColors.surface, isTextOnHidden: true),
            ColorsCell.ViewModel(colorName: "highEmphasis", color: NatColors.highEmphasis, onColor: NatColors.surface, isTextOnHidden: true),
            ColorsCell.ViewModel(colorName: "mediumEmphasis", color: NatColors.mediumEmphasis, onColor: NatColors.surface, isTextOnHidden: true),
            ColorsCell.ViewModel(colorName: "lowEmphasis", color: NatColors.lowEmphasis, onColor: NatColors.surface, isTextOnHidden: true)
        ],
        "Feedback": [
            ColorsCell.ViewModel(colorName: "success", color: NatColors.success, onColor: NatColors.onSuccess, isTextOnHidden: false),
            ColorsCell.ViewModel(colorName: "warning", color: NatColors.warning, onColor: NatColors.onWarning, isTextOnHidden: false),
            ColorsCell.ViewModel(colorName: "alert", color: NatColors.alert, onColor: NatColors.onAlert, isTextOnHidden: false),
            ColorsCell.ViewModel(colorName: "link", color: NatColors.link, onColor: NatColors.onLink, isTextOnHidden: false)
        ]
    ]

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ColorsCell.self, forCellReuseIdentifier: ColorsCell.reuseIdentifier)
        tableView.register(ColorsHeader.self, forHeaderFooterViewReuseIdentifier: ColorsHeader.reuseIdentifier)
        tableView.rowHeight = 64
        tableView.sectionHeaderHeight = 50
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self

        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = Self.name

        setup()
    }

    @objc private func navigationButtonTapHandler() {
        setupUserInterfaceStyle()
        tableView.reloadData()
    }

    private func setupUserInterfaceStyle() {
        if #available(iOS 13.0, *) {
            if overrideUserInterfaceStyle == .dark {
                overrideUserInterfaceStyle = .light
            } else {
                overrideUserInterfaceStyle = .dark
            }
        }
    }

    private func setup() {
        view.backgroundColor = NatColors.background

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Light/Dark",
            style: .plain,
            target: self,
            action: #selector(navigationButtonTapHandler)
        )

        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            tableView.rightAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.rightAnchor,
                constant: -8
            ),
            tableView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ),
            tableView.leftAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leftAnchor,
                constant: 8
            )
        ])
    }
}

extension ColorsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: ColorsHeader.reuseIdentifier
            ) as? ColorsHeader

        let name = sections[section]
        headerCell?.configure(section: name)
        return headerCell!
    }
}

extension ColorsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        cellsViewModel.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionName = sections[section]
        return cellsViewModel[sectionName]?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ColorsCell.reuseIdentifier,
            for: indexPath
        ) as? ColorsCell ?? ColorsCell()

        let colorGroup = sections[indexPath.section]

        if let color = cellsViewModel[colorGroup]?[indexPath.item] {
            cell.configure(viewModel: color)
        }

        return cell
    }
}

public func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
