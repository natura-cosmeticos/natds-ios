import UIKit
import NatDS

class ListItemViewController: UIViewController, SampleItem {
    static var name: String = "List Item"

    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = NatColors.background
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override func viewDidLoad() {
        title = Self.name
        view.backgroundColor = NatColors.background
        setup()
    }

    private func setup() {
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(NatListItemCell.self, forCellReuseIdentifier: "id")
        tableView.separatorStyle = .none
        tableView.allowsMultipleSelection = true
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
    }
}

extension ListItemViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: NatListItemCell = (tableView.dequeueReusableCell(withIdentifier: "id",
                                                                   for: indexPath) as? NatListItemCell)!

        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Onclick false (default)"
            cell.configure(divider: .inset)
        case 1:
            cell.configure(onClick: true)
            cell.textLabel?.text = "Onclick true"
            cell.configure(divider: .inset)
        case 2:
            cell.configure(onClick: true)
            cell.textLabel?.text = "Selected cell"
            cell.configure(divider: .inset)
        case 3:
            cell.configure(divider: .inset)
            cell.textLabel?.text = "Divider inset"
        case 4:
            cell.configure(divider: .middle)
            cell.textLabel?.text = "Divider middle"
        case 5:
            cell.configure(divider: .fullBleed)
            cell.textLabel?.text = "Divider fullbleed"
        default:
            cell.configure(divider: .inset)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            cell.setSelected(true, animated: true)
            tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return NatSizes.medium
    }
}
