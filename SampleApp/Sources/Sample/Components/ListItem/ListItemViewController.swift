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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NatListItemCell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath) as! NatListItemCell
        cell.configure(divider: .inset)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return NatSizes.medium
    }
}
