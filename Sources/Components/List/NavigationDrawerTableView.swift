protocol MyCellDelegate: AnyObject {}

class MyCell: UITableViewCell {

    @IBOutlet weak var item: NavigationDrawerItem!

    weak var delegate: MyCellDelegate?

    private var index: Int = 0

    class func cell(tableView: UITableView, index: Int) -> MyCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as? MyCell
        cell?.index = index
        cell?.configure()
        return cell!
    }

    // MARK: Private methods
    private func configure() {
        item.text = "Menu item"
    }

}

protocol NavigationDrawerTableViewDataSource {
    func numberOfItems() -> Int
    func numberOfSubitems(at item: Int) -> Int
    func viewForItem(at item: Int) -> NavigationDrawerItem
    func viewForSubItem(at index: Int, item: Int) -> NavigationDrawerSubmenuItem
}

class NavigationDrawerTableView: UITableView {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension NavigationDrawerTableView {

    func setup() {

        let reuseIdentifier = "MyCell"
        let cellClass = MyCell.self
        let bundle = Bundle(for: cellClass)
        let nib = UINib.init(nibName: reuseIdentifier, bundle: bundle)
        register(nib, forCellReuseIdentifier: reuseIdentifier)

        let cellHeight = 44.0
        rowHeight = UITableView.automaticDimension
        estimatedRowHeight = CGFloat(cellHeight)
        tableFooterView = UIView(frame: .zero)
        separatorStyle = .none
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        allowsSelection = false
        dataSource = self
        delegate = self
        backgroundColor = .white
    }

}

extension NavigationDrawerTableView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return MyCell.cell(tableView: tableView, index: indexPath.row)
    }

}

extension NavigationDrawerTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
}
