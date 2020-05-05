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
        ("micro: \(DSSize.micro)", DSSize.micro),
        ("tiny: \(DSSize.tiny)", DSSize.tiny),
        ("small: \(DSSize.small)", DSSize.small),
        ("standard: \(DSSize.standart)", DSSize.standart),
        ("semi: \(DSSize.semi)", DSSize.semi),
        ("semiX: \(DSSize.semiX)", DSSize.semiX),
        ("medium: \(DSSize.medium)", DSSize.medium),
        ("mediumX: \(DSSize.mediumX)", DSSize.mediumX),
        ("large: \(DSSize.large)", DSSize.large),
        ("largeX: \(DSSize.largeX)", DSSize.largeX),
        ("largeXX: \(DSSize.largeXX)", DSSize.largeXX),
        ("largeXXX: \(DSSize.largeXXX)", DSSize.largeXXX),
        ("huge: \(DSSize.huge)", DSSize.huge),
        ("hugeX: \(DSSize.hugeX)", DSSize.hugeX),
        ("hugeXX: \(DSSize.hugeXX)", DSSize.hugeXX),
        ("hugeXXX: \(DSSize.hugeXXX)", DSSize.hugeXXX),
        ("veryHuge: \(DSSize.veryHuge)", DSSize.veryHuge)
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
