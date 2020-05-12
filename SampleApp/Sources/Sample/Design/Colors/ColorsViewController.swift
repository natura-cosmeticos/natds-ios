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
            ("primary", NatColors.primary, NatColors.onPrimary, false),
            ("primaryLight", NatColors.primaryLight, NatColors.onPrimaryLight, false),
            ("primaryDark", NatColors.primaryDark, NatColors.onPrimaryDark, false)
        ],
        "Secondary": [
            ("secondary", NatColors.secondary, NatColors.onSecondary, false),
            ("secondaryLight", NatColors.secondaryLight, NatColors.onSecondaryLight, false),
            ("secondaryDark", NatColors.secondaryDark, NatColors.onSecondaryDark, false)
        ],
        "Surface": [
            ("background", NatColors.background, NatColors.onBackground, false),
            ("surface", NatColors.surface, NatColors.onSurface, false)
        ],
        "Content": [
            ("highlight", NatColors.highlight, NatColors.surface, true),
            ("highEmphasis", NatColors.highEmphasis, NatColors.surface, true),
            ("mediumEmphasis", NatColors.mediumEmphasis, NatColors.surface, true),
            ("lowEmphasis", NatColors.lowEmphasis, NatColors.surface, true)
        ],
        "Feedback": [
            ("success", NatColors.success, NatColors.onSuccess, false),
            ("warning", NatColors.warning, NatColors.onWarning, false),
            ("alert", NatColors.alert, NatColors.onAlert, false),
            ("link", NatColors.link, NatColors.onLink, false)
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
