import NatDS
import UIKit
import NatDSIcons

class AppBarDetailViewController: UITableViewController {
    private let sections: [AppBarSection] = AppBarSection.allCases

    init() {
        super.init(style: .plain)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
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

    // swiftlint:disable:next cyclomatic_complexity
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
        case.oneActionRight:
            let iconButton = NatIconButton(style: .standardDefault, size: .semi)
            iconButton.configure(icon: getIcon(.outlinedDefaultMockup))
            self.configure(actionRight: [iconButton])
        case .threeActionsRight:
            let iconButton = NatIconButton(style: .standardDefault, size: .semi)
            iconButton.configure(icon: getIcon(.outlinedDefaultMockup))
            let secondIconButton = NatIconButton(style: .standardDefault, size: .semi)
            secondIconButton.configure(icon: getIcon(.outlinedDefaultMockup))
            let thirdIconButton = NatIconButton(style: .standardDefault, size: .semi)
            thirdIconButton.configure(icon: getIcon(.outlinedDefaultMockup))
            self.configure(actionRight: [iconButton, secondIconButton, thirdIconButton])
        case .oneActionLeft:
            let iconButton = NatIconButton(style: .standardDefault, size: .semi)
            iconButton.configure(icon: getIcon(.outlinedDefaultMockup))
            self.configure(actionLeft: iconButton)
        case .positionCenter:
            self.configure(position: .center("Center"))
        case .positionLeft:
            self.configure(position: .left("Left"))
        }
    }

    @objc func calendarBarButtonItemHandler() {
        print("calendarBarButtonItem called")
    }

    @objc func notificationBarButtonItemHandler() {
        print("notificationBarButtonItem called")
    }
}
