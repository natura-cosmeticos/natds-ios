import UIKit
import NatDS

final class MainViewController: UITableViewController {

    let dataSource = MainDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "GaYa"

        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        tableView.register(UITableViewCell.self)
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = NatColors.background

        view.backgroundColor = NatColors.background
      
      self.navigationController?.configureAppBar(color: .primary, contentType: .colorLogo, hasTransparency: true, scrollView: tableView)
    }
  
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if isMovingFromParent {
            self.navigationController?.stopObservingScrollView(scrollView: tableView)
        }
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
        
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UITableViewCell.self)
        cell.textLabel?.text = item.name
        cell.textLabel?.textColor = NatColors.onBackground
        cell.selectionStyle = .none
        cell.backgroundColor = NatColors.background
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = dataSource.sections[indexPath.section].items[indexPath.row]
        let vc = item.init()
        navigationController?.pushViewController(vc, animated: true)
    }
}
