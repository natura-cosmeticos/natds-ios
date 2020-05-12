import UIKit
import NatDS

final class BorderRadiusViewController: UIViewController, SampleItem {
    static var name = "Border Radius"

    // MARK: - Private properties

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            BorderRadiusCell.self,
            forCellReuseIdentifier: BorderRadiusCell.reuseIdentifier
        )
        tableView.rowHeight = NatSizes.hugeXX
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self

        return tableView
    }()

    private let cellsViewModels: [(description: String, value: CGFloat)] = [
        ("none: 0", 0),
        ("small: \(NatBorderRadius.small)", NatBorderRadius.small),
        ("medium: \(NatBorderRadius.medium)", NatBorderRadius.medium),
        ("large: \(NatBorderRadius.large)", NatBorderRadius.large),
        ("circle: viewHeight / 2", NatBorderRadius.circle(viewHeight: NatSizes.huge))
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

extension BorderRadiusViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellsViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: BorderRadiusCell.reuseIdentifier,
            for: indexPath
        ) as? BorderRadiusCell ?? BorderRadiusCell()

        let viewModel = cellsViewModels[indexPath.row]

        cell.configure(description: viewModel.description, cornerRadius: viewModel.value)

        return cell
    }
}
