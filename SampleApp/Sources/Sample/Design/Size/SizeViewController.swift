import UIKit
import NatDS

final class SizeViewController: UIViewController, SampleItem {
    static var name = "Size"

    // MARK: - Private properties

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SizeCell.self, forCellReuseIdentifier: SizeCell.reuseIdentifier)
        tableView.rowHeight = 60
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self

        return tableView
    }()

    private let cellsViewModels: [(description: String, value: CGFloat)] = [
        ("micro: \(DSSizes.micro)", DSSizes.micro),
        ("tiny: \(DSSizes.tiny)", DSSizes.tiny),
        ("small: \(DSSizes.small)", DSSizes.small),
        ("standard: \(DSSizes.standart)", DSSizes.standart),
        ("semi: \(DSSizes.semi)", DSSizes.semi),
        ("semiX: \(DSSizes.semiX)", DSSizes.semiX),
        ("medium: \(DSSizes.medium)", DSSizes.medium),
        ("mediumX: \(DSSizes.mediumX)", DSSizes.mediumX),
        ("large: \(DSSizes.large)", DSSizes.large),
        ("largeX: \(DSSizes.largeX)", DSSizes.largeX),
        ("largeXX: \(DSSizes.largeXX)", DSSizes.largeXX),
        ("largeXXX: \(DSSizes.largeXXX)", DSSizes.largeXXX),
        ("huge: \(DSSizes.huge)", DSSizes.huge),
        ("hugeX: \(DSSizes.hugeX)", DSSizes.hugeX),
        ("hugeXX: \(DSSizes.hugeXX)", DSSizes.hugeXX),
        ("hugeXXX: \(DSSizes.hugeXXX)", DSSizes.hugeXXX),
        ("veryHuge: \(DSSizes.veryHuge)", DSSizes.veryHuge)
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
