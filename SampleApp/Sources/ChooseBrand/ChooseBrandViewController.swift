import UIKit
import NatDS

final class ChooseBrandViewController: UIViewController {

    // MARK: - Private properties

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
        tableView.register(ChooseBrandCell.self, forCellReuseIdentifier: ChooseBrandCell.reuseIdentifier)
        tableView.sectionHeaderHeight = 193
        tableView.rowHeight = 80
        tableView.bounces = false

        return tableView
    }()

    private let brands = [
        "brand_selection/aesop",
        "brand_selection/avon",
        "brand_selection/natura",
        "brand_selection/natura&co",
        "brand_selection/the_body_shop"
    ]

    // MARK: - Life cycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

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

    // MARK: - Overrides

    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
}

// MARK: - UITableViewDataSource

extension ChooseBrandViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        brands.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView
            .dequeueReusableCell(
                withIdentifier: ChooseBrandCell.reuseIdentifier,
                for: indexPath
            ) as? ChooseBrandCell ?? .init()

        cell.configure(imageName: brands[indexPath.row])

        return cell
    }
}

// MARK: - UITableViewDelegate

extension ChooseBrandViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: ChooseBrandHeader.reuseIdentifier
            ) as? ChooseBrandHeader ?? ChooseBrandHeader()

        return headerCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let brandThemes: BrandThemes

        switch indexPath.row {
        case 0: return
        case 1: brandThemes = .init(light: .avonLight, dark: .avonDark)
        case 2: brandThemes = .init(light: .naturaLight, dark: .naturaDark)
        case 3: return
        case 4: brandThemes = .init(light: .theBodyShopLight, dark: .theBodyShopDark)
        default: fatalError("not implemented")
        }

        ThemeManager.shared.currentBrand = brandThemes
        ThemeManager.shared.setLight()

        let viewController = MainViewController()
        navigationController?.navigationBar.barTintColor = NatColors.primary
        navigationController?.navigationBar.tintColor = NatColors.onPrimary
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: NatColors.onPrimary
        ]
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - Private methods

extension ChooseBrandViewController {
    private func setup() {
        tableView.contentInsetAdjustmentBehavior = .never
        view.backgroundColor = .black
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor)
        ])
    }
}
