import NatDS
import UIKit
import NatDSIcons

class AppBarDetailViewController: UITableViewController {
    private var appBarStyle: UINavigationController.AppBarStyle
    private let sections: [AppBarSection] = AppBarSection.allCases

    init(appBarStyle: UINavigationController.AppBarStyle) {
        self.appBarStyle = appBarStyle
        super.init(style: .plain)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
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
        case .colorDefault:
            self.navigationController?.configure(color: .default)
        case .colorInverse:
            self.navigationController?.configure(color: .inverse)
        case .colorPrimary:
            self.navigationController?.configure(color: .primary)
        case .colorNone:
            self.navigationController?.configure(color: .none)
        case .elevationTrue:
            self.navigationController?.configure(elevation: true)
        case .elevationFalse:
            self.navigationController?.configure(elevation: false)
        default:
            return
        }

//        switch item {
//        case .textTitleStyle:
//            configure(titleStyle: .logo)
//        case .logoTitleStyle:
//            configure(titleStyle: .title("New title"))
//        case .noneBarItems:
//            configure(buttons: [UIBarButtonItem]())
//        case .twoBarItems:
//            let calendarBarButtonItem = UIBarButtonItem(icon: getIcon(.outlinedActionCalendar),
//                                                        action: #selector(calendarBarButtonItemHandler),
//                                                        target: self)
//
//            let notificationBarButtonItem = UIBarButtonItem(icon: getIcon(.outlinedAlertNotification),
//                                                         action: #selector(notificationBarButtonItemHandler),
//                                                         target: self)
//
//            let badge = NatBadge(style: .standard, color: .alert)
//            badge.configure(count: 9)
//            notificationBarButtonItem.configure(badge: badge)
//
//            let barItems = [notificationBarButtonItem, calendarBarButtonItem]
//            configure(buttons: barItems)
//        }
    }

    @objc func calendarBarButtonItemHandler() {
        print("calendarBarButtonItem called")
    }

    @objc func notificationBarButtonItemHandler() {
        print("notificationBarButtonItem called")
    }
}
