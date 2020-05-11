import UIKit
import NatDS

final class OpacityViewController: UIViewController, SampleItem {
    static var name = "Opacity"

    // MARK: - Private properties

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(OpacityCell.self, forCellReuseIdentifier: OpacityCell.reuseIdentifier)
        tableView.rowHeight = DSSizes.huge
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self

        return tableView
    }()

    private let cellsViewModels: [(description: String, value: CGFloat)] = [
        ("none: 1", 1),
        ("opacity01: \(DSOpacities.opacity01)", DSOpacities.opacity01),
        ("opacity02: \(DSOpacities.opacity02)", DSOpacities.opacity02),
        ("opacity03: \(DSOpacities.opacity03)", DSOpacities.opacity03),
        ("opacity04: \(DSOpacities.opacity04)", DSOpacities.opacity04),
        ("opacity05: \(DSOpacities.opacity05)", DSOpacities.opacity05),
        ("opacity06: \(DSOpacities.opacity06)", DSOpacities.opacity06),
        ("opacity07: \(DSOpacities.opacity07)", DSOpacities.opacity07),
        ("opacity08: \(DSOpacities.opacity08)", DSOpacities.opacity08),
        ("opacity09: \(DSOpacities.opacity09)", DSOpacities.opacity09),
        ("opacity10: \(DSOpacities.opacity10)", DSOpacities.opacity10)
    ]

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = Self.name

        setup()
    }

    // MARK: - Private methods

    private func setup() {
        view.backgroundColor = DSColors.background
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            tableView.rightAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.rightAnchor,
                constant: -DSSpacing.tiny
            ),
            tableView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ),
            tableView.leftAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leftAnchor,
                constant: DSSpacing.tiny
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
