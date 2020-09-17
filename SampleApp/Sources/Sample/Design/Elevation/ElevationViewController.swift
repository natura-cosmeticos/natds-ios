import UIKit
import NatDS

final class ElevationViewController: UIViewController, SampleItem {
    static var name = "Elevation"

    // MARK: - Private properties

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            ElevationCell.self,
            forCellReuseIdentifier: ElevationCell.reuseIdentifier
        )
        tableView.rowHeight = NatSizes.hugeXX
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.backgroundColor = NatColors.background

        return tableView
    }()

    private let cellsViewModels: [(description: String, value: NatElevation.Elevation)] = [
        ("none", .none),
        ("elevation01", .elevation01),
        ("elevation02", .elevation02),
        ("elevation03", .elevation03),
        ("elevation04", .elevation04),
        ("elevation05", .elevation05),
        ("elevation06", .elevation06),
        ("elevation07", .elevation07),
        ("elevation08", .elevation08),
        ("elevation09", .elevation09),
        ("elevation10", .elevation10)
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

extension ElevationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellsViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ElevationCell.reuseIdentifier,
            for: indexPath
        ) as? ElevationCell ?? ElevationCell()

        let viewModel = cellsViewModels[indexPath.row]

        cell.configure(description: viewModel.description, elevation: viewModel.value)

        return cell
    }
}
