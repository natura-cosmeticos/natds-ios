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
            ("primary", DSColors.primary, DSColors.onPrimary, false),
            ("primaryLight", DSColors.primaryLight, DSColors.onPrimaryLight, false),
            ("primaryDark", DSColors.primaryDark, DSColors.onPrimaryDark, false)
        ],
        "Secondary": [
            ("secondary", DSColors.secondary, DSColors.onSecondary, false),
            ("secondaryLight", DSColors.secondaryLight, DSColors.onSecondaryLight, false),
            ("secondaryDark", DSColors.secondaryDark, DSColors.onSecondaryDark, false)
        ],
        "Surface": [
            ("background", DSColors.background, DSColors.onBackground, false),
            ("surface", DSColors.surface, DSColors.onSurface, false)
        ],
        "Content": [
            ("highlight", DSColors.highlight, DSColors.surface, true),
            ("highEmphasis", DSColors.highEmphasis, DSColors.surface, true),
            ("mediumEmphasis", DSColors.mediumEmphasis, DSColors.surface, true),
            ("lowEmphasis", DSColors.lowEmphasis, DSColors.surface, true)
        ],
        "Feedback": [
            ("success", DSColors.success, DSColors.onSuccess, false),
            ("warning", DSColors.warning, DSColors.onWarning, false),
            ("alert", DSColors.alert, DSColors.onAlert, false),
            ("link", DSColors.link, DSColors.onLink, false)
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
        view.backgroundColor = DSColors.background

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
