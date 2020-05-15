import UIKit
import NatDS

final class OpacityViewController: UIViewController, SampleItem {
    static var name = "Opacity"

    // MARK: - Private properties

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(OpacityCell.self, forCellReuseIdentifier: OpacityCell.reuseIdentifier)
        tableView.rowHeight = NatSizes.huge
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self

        return tableView
    }()

    private let cellsViewModels: [(description: String, value: CGFloat)] = [
        ("transparent: \(NatOpacities.transparent)", NatOpacities.transparent),
        ("opacity01: \(NatOpacities.opacity01)", NatOpacities.opacity01),
        ("opacity02: \(NatOpacities.opacity02)", NatOpacities.opacity02),
        ("opacity03: \(NatOpacities.opacity03)", NatOpacities.opacity03),
        ("opacity04: \(NatOpacities.opacity04)", NatOpacities.opacity04),
        ("opacity05: \(NatOpacities.opacity05)", NatOpacities.opacity05),
        ("opacity06: \(NatOpacities.opacity06)", NatOpacities.opacity06),
        ("opacity07: \(NatOpacities.opacity07)", NatOpacities.opacity07),
        ("opacity08: \(NatOpacities.opacity08)", NatOpacities.opacity08),
        ("opacity09: \(NatOpacities.opacity09)", NatOpacities.opacity09),
        ("opacity10: \(NatOpacities.opacity10)", NatOpacities.opacity10),
        ("full: \(NatOpacities.full)", NatOpacities.full)
    ]

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = Self.name

        setup()
    }

    // MARK: - Private methods

    private func setup() {
        view.backgroundColor = NatColors.background
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            tableView.rightAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.rightAnchor,
                constant: -NatSpacing.tiny
            ),
            tableView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ),
            tableView.leftAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leftAnchor,
                constant: NatSpacing.tiny
            )
        ])
    }
}

// MARK: - UITableViewDataSource

extension OpacityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellsViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: OpacityCell.reuseIdentifier,
            for: indexPath
        ) as? OpacityCell ?? OpacityCell()

        let viewModel = cellsViewModels[indexPath.row]

        cell.configure(description: viewModel.description, alpha: viewModel.value)

        return cell
    }
}
