import UIKit
import NatDS

final class SpacingViewController: UIViewController, SampleItem {
    static var name = "Spacing"

    // MARK: - Private properties

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SpacingCell.self, forCellReuseIdentifier: SpacingCell.reuseIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self

        return tableView
    }()

    private let cellsViewModels: [(description: String, value: CGFloat)] = [
        ("micro: \(DSSpacing.micro)", DSSpacing.micro),
        ("tiny: \(DSSpacing.tiny)", DSSpacing.tiny),
        ("small: \(DSSpacing.small)", DSSpacing.small),
        ("standard: \(DSSpacing.standart)", DSSpacing.standart),
        ("semi: \(DSSpacing.semi)", DSSpacing.semi),
        ("large: \(DSSpacing.large)", DSSpacing.large),
        ("xLarge: \(DSSpacing.xLarge)", DSSpacing.xLarge)
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

extension SpacingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellsViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: SpacingCell.reuseIdentifier,
            for: indexPath
        ) as? SpacingCell ?? SpacingCell()

        let viewModel = cellsViewModels[indexPath.row]

        cell.configure(description: viewModel.description, spacing: viewModel.value)

        return cell
    }
}
