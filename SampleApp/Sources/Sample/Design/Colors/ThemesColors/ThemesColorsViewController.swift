import NatDS

class ThemesColorsViewController: UIViewController, SampleItem {
    static var name = "Themes Colors"

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.reuseIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = Self.name

        tableView.dataSource = self

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Light/Dark", style: .plain, target: self, action: #selector(addTapped))
        setup()

    }

    @objc private func addTapped() {
        if #available(iOS 13.0, *) {
            if overrideUserInterfaceStyle == .dark {
                overrideUserInterfaceStyle = .light
            } else {
                overrideUserInterfaceStyle = .dark
            }
            tableView.reloadData()
        }
    }

    private func setup() {
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
    }
}

extension ThemesColorsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        colors.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let colorGroup = sections[section]
        return colors[colorGroup]?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.reuseIdentifier, for: indexPath)

        let colorGroup = sections[indexPath.section]
        let color = colors[colorGroup]?[indexPath.item]

        cell.backgroundColor = color!.color
        cell.textLabel?.text = "\(color!.name) - \(color!.color.hex)"
        cell.textLabel?.textColor = color!.textColor


        return cell
    }
}

private let sections = [
    "Primary",
    "Secondary",
    "Surface",
    "Content",
    "Feedback"
]
private let colors: [String: [DSColorF]] = [
    "Primary": [
        ("primary", DSColors.primary, DSColors.onPrimary),
        ("onPrimary", DSColors.onPrimary, DSColors.primary),
        ("primaryLight", DSColors.primaryLight, DSColors.onPrimaryLight),
        ("onPrimaryLight", DSColors.onPrimaryLight, DSColors.primaryLight),
        ("primaryDark", DSColors.primaryDark, DSColors.onPrimaryDark),
        ("onPrimaryDark", DSColors.onPrimaryDark, DSColors.primaryDark)
    ],
    "Secondary": [
        ("secondary", DSColors.secondary, DSColors.onSecondary),
        ("onSecondary", DSColors.onSecondary, DSColors.secondary),
        ("secondaryLight", DSColors.secondaryLight, DSColors.onSecondaryLight),
        ("onSecondaryLight", DSColors.onSecondaryLight, DSColors.secondaryLight),
        ("secondaryDark", DSColors.secondaryDark, DSColors.onSecondaryDark),
        ("onSecondaryDark", DSColors.onSecondaryDark, DSColors.secondaryDark)
    ],
    "Surface": [
        ("background", DSColors.background, DSColors.onBackground),
        ("onBackground", DSColors.onBackground, DSColors.background),
        ("surface", DSColors.surface, DSColors.onSurface),
        ("onSurface", DSColors.onSurface, DSColors.surface)
    ],
    "Content": [
        ("highlight", DSColors.highlight, DSColors.surface),
        ("highEmphasis", DSColors.highEmphasis, DSColors.surface),
        ("mediumEmphasis", DSColors.mediumEmphasis, DSColors.surface),
        ("lowEmphasis", DSColors.lowEmphasis, DSColors.surface),
        ("link", DSColors.link, DSColors.onLink),
        ("onLink", DSColors.onLink, DSColors.link)
    ],
    "Feedback": [
        ("success", DSColors.success, DSColors.onSuccess),
        ("onSuccess", DSColors.onSuccess, DSColors.success),
        ("warning", DSColors.warning, DSColors.onWarning),
        ("onWarning", DSColors.onWarning, DSColors.warning),
        ("alert", DSColors.alert, DSColors.onAlert),
        ("onAlert", DSColors.onAlert, DSColors.alert)
    ]
]

private extension UIColor {
    var hex: String {
        let components = cgColor.components
        let red: CGFloat = components?[0] ?? 0.0
        let green: CGFloat = components?[1] ?? 0.0
        let blue: CGFloat = components?[2] ?? 0.0

        let hexString = String.init(format: "#%02lX%02lX%02lX",
                                    lroundf(Float(red * 255)),
                                    lroundf(Float(green * 255)),
                                    lroundf(Float(blue * 255)))
        return hexString
    }
}

typealias DSColorF = (name: String, color: UIColor, textColor: UIColor)
