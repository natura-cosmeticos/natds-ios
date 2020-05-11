import UIKit
import NatDS

// swiftlint:disable function_body_length

final class TipographyViewController: UIViewController, SampleItem {
    static var name = "Tipography"

    // MARK: - Private properties

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            TipographyCell.self,
            forCellReuseIdentifier: TipographyCell.reuseIdentifier
        )
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self

        return tableView
    }()

    private lazy var cellsViewModels: [TipographyCell.ViewModel] = createCellsViewModels()

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

    private func createCellsViewModels() -> [TipographyCell.ViewModel] {
        [
            .init(
                sizeDescription: "heading1",
                weightDescription: "regular",
                font: NatFonts.font(ofSize: .heading1, withWeight: .regular)
            ),
            .init(
                sizeDescription: "heading2",
                weightDescription: "regular",
                font: NatFonts.font(ofSize: .heading2, withWeight: .regular)
            ),
            .init(
                sizeDescription: "heading3:",
                weightDescription: "regular",
                font: NatFonts.font(ofSize: .heading3, withWeight: .regular)
            ),
            .init(
                sizeDescription: "heading4:",
                weightDescription: "regular",
                font: NatFonts.font(ofSize: .heading4, withWeight: .regular)
            ),
            .init(
                sizeDescription: "heading5:",
                weightDescription: "regular",
                font: NatFonts.font(ofSize: .heading5, withWeight: .regular)
            ),
            .init(
                sizeDescription: "heading6:",
                weightDescription: "medium",
                font: NatFonts.font(ofSize: .heading6, withWeight: .medium)
            ),
            .init(
                sizeDescription: "subtitle1:",
                weightDescription: "medium",
                font: NatFonts.font(ofSize: .subtitle1, withWeight: .medium)
            ),
            .init(
                sizeDescription: "subtitle2:",
                weightDescription: "medium",
                font: NatFonts.font(ofSize: .subtitle2, withWeight: .medium)
            ),
            .init(
                sizeDescription: "body1:",
                weightDescription: "regular",
                font: NatFonts.font(ofSize: .body1, withWeight: .regular)
            ),
            .init(
                sizeDescription: "body2:",
                weightDescription: "regular",
                font: NatFonts.font(ofSize: .body2, withWeight: .regular)
            ),
            .init(
                sizeDescription: "button:",
                weightDescription: "medium",
                font: NatFonts.font(ofSize: .button, withWeight: .medium)
            ),
            .init(
                sizeDescription: "caption:",
                weightDescription: "regular",
                font: NatFonts.font(ofSize: .caption, withWeight: .regular)
            ),
            .init(
                sizeDescription: "overline:",
                weightDescription: "medium",
                font: NatFonts.font(ofSize: .overline, withWeight: .medium)
            )
        ]
    }
}

// MARK: - UITableViewDataSource

extension TipographyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellsViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TipographyCell.reuseIdentifier,
            for: indexPath
        ) as? TipographyCell ?? TipographyCell()

        let viewModel = cellsViewModels[indexPath.row]

        cell.configure(viewModel: viewModel)

        return cell
    }
}
