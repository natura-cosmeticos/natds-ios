import NatDS
import UIKit

class AppBarDetailViewController: UITableViewController {
    private var appBarStyle: UINavigationController.Style
    private let sections: [AppBarSection] = AppBarSection.allCases

    init(appBarStyle: UINavigationController.Style) {
        self.appBarStyle = appBarStyle
        super.init(style: .plain)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "App bar"
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.configure(style: appBarStyle)
    }

    private func setupTableView() {
        tableView.register(UITableViewCell.self)
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.allowsMultipleSelection = false
    }

    // MARK: - Tableview delegate and dataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        return section.items.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = sections[section]
        return section.title
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = sections[indexPath.section].items[indexPath.row]
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UITableViewCell.self)
        cell.textLabel?.text = item.title
        cell.selectionStyle = .default
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = sections[indexPath.section].items[indexPath.row]

        switch item {
        case .textTitleStyle:
            configure(titleStyle: .logo)
        case .logoTitleStyle:
            configure(titleStyle: .title("New title"))
        case .noneBarItems:
            configure(buttons: [UIBarButtonItem]())
        case .twoBarItems:
            let barButtonItem = UIBarButtonItem(icon: .outlinedActionCalendar,
                                                action: #selector(barButtonItemHandler),
                                                target: self)

            let barButtonItemWithBadge = UIBarButtonItem(icon: .outlinedAlertNotification,
                                                         action: nil,
                                                         target: nil)
            barButtonItemWithBadge.setBadgeValue(9)

            let barItems = [barButtonItemWithBadge, barButtonItem]
            configure(buttons: barItems)
        }
    }

    @objc func barButtonItemHandler() {
        print("barButtonItemHandler called")
    }
}
