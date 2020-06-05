import UIKit
import NatDS

final class SizeViewController: UIViewController, SampleItem {
    static var name = "Size"

    // MARK: - Private properties

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SizeCell.self, forCellReuseIdentifier: SizeCell.reuseIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self

        return tableView
    }()

    private let cellsViewModels: [(description: String, value: CGFloat)] = [
        ("micro: \(NatSizes.micro)", NatSizes.micro),
        ("tiny: \(NatSizes.tiny)", NatSizes.tiny),
        ("small: \(NatSizes.small)", NatSizes.small),
        ("standard: \(NatSizes.standard)", NatSizes.standard),
        ("semi: \(NatSizes.semi)", NatSizes.semi),
        ("semiX: \(NatSizes.semiX)", NatSizes.semiX),
        ("medium: \(NatSizes.medium)", NatSizes.medium),
        ("mediumX: \(NatSizes.mediumX)", NatSizes.mediumX),
        ("large: \(NatSizes.large)", NatSizes.large),
        ("largeX: \(NatSizes.largeX)", NatSizes.largeX),
        ("largeXX: \(NatSizes.largeXX)", NatSizes.largeXX),
        ("largeXXX: \(NatSizes.largeXXX)", NatSizes.largeXXX),
        ("huge: \(NatSizes.huge)", NatSizes.huge),
        ("hugeX: \(NatSizes.hugeX)", NatSizes.hugeX),
        ("hugeXX: \(NatSizes.hugeXX)", NatSizes.hugeXX),
        ("hugeXXX: \(NatSizes.hugeXXX)", NatSizes.hugeXXX),
        ("veryHuge: \(NatSizes.veryHuge)", NatSizes.veryHuge)
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

extension SizeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellsViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: SizeCell.reuseIdentifier,
            for: indexPath
        ) as? SizeCell ?? SizeCell()

        let viewModel = cellsViewModels[indexPath.row]

        cell.configure(description: viewModel.description, size: viewModel.value)

        return cell
    }
}
