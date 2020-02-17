import UIKit

class MainViewController: UITableViewController {

    let dataSource = MainDataSource()
    let cellID = "SectionCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sample App"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.sections[section].items.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataSource.sections[section].name
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = dataSource.sections[indexPath.section].items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = item.name
        cell.selectionStyle = .none
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = dataSource.sections[indexPath.section].items[indexPath.row]
        let vc = item.init()
        navigationController?.pushViewController(vc, animated: true)
    }
}
