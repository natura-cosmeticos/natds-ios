import UIKit
import NatDS

final class ChooseBrandViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: ChooseBrandHeader.reuseIdentifier
        )
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .black
        tableView.register(ColorsHeader.self, forHeaderFooterViewReuseIdentifier: ChooseBrandHeader.reuseIdentifier)
        tableView.sectionHeaderHeight = 128 + 65
        tableView.rowHeight = 64

        return tableView
    }()

    private let brands = [
        "Avon",
        "Natura",
        "The Body Shop"
    ]

    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
        navigationController?.isNavigationBarHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        navigationController?.isNavigationBarHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

//    override var prefersStatusBarHidden: Bool {
//        return true
//    }

    private func setup() {
//        title = "Choose a Brand"
        tableView.contentInsetAdjustmentBehavior = .never

//        UINavigationBar.appearance().backgroundColor = .white
//        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)

        view.backgroundColor = NatColors.background
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor)
        ])
    }
}

extension ChooseBrandViewController: UITableViewDataSource {
    //    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    //        20
    //    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        brands.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChooseBrandHeader.reuseIdentifier, for: indexPath)

        cell.textLabel?.textColor = NatColors.onBackground
        cell.textLabel?.text = brands[indexPath.row]
        cell.selectionStyle = .none
        cell.backgroundColor = NatColors.background

        return cell
    }
}

extension ChooseBrandViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: ChooseBrandHeader.reuseIdentifier
            ) as? ChooseBrandHeader ?? ChooseBrandHeader()

        return headerCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            DesignSystem().configure(with: .avonLight)
        case 1:
            DesignSystem().configure(with: .naturaLight)
        case 2:
            DesignSystem().configure(with: .theBodyShopLight)
        default:
            fatalError("Not implemented")
        }

        let viewController = MainViewController()
        navigationController?.navigationBar.barTintColor = NatColors.primary
        navigationController?.navigationBar.tintColor = NatColors.onPrimary
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: NatColors.onPrimary
        ]
        navigationController?.pushViewController(viewController, animated: true)
    }
}
