import UIKit
import NatDS

// swiftlint:disable function_body_length

final class TypographyViewController: UIViewController, SampleItem {
    static var name = "Typography"

    // MARK: - Private properties

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            TypographyCell.self,
            forCellReuseIdentifier: TypographyCell.reuseIdentifier
        )
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.backgroundColor = NatColors.background

        return tableView
    }()

    private lazy var cellsViewModels: [TypographyCell.ViewModel] = createCellsViewModels()

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

    private func createCellsViewModels() -> [TypographyCell.ViewModel] {
        [
            .init(
                sizeDescription: "display",
                weightDescription: "custom",
                font: NatFonts.customFont(ofSize: .heading1, withStyle: .display)
            ),
            .init(
                sizeDescription: "headline",
                weightDescription: "custom",
                font: NatFonts.customFont(ofSize: .heading1, withStyle: .headline)
            ),
            .init(
                sizeDescription: "body regular",
                weightDescription: "custom",
                font: NatFonts.customFont(ofSize: .heading1, withStyle: .bodyRegular)
            ),
            .init(
                sizeDescription: "body bold",
                weightDescription: "custom",
                font: NatFonts.customFont(ofSize: .heading1, withStyle: .bodyBold)
            ),
            .init(
                sizeDescription: "heading1:",
                weightDescription: "regular",
                font: NatFonts.font(ofSize: .heading1, withWeight: .regular)
            ),
            .init(
                sizeDescription: "heading2:",
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

extension TypographyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellsViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TypographyCell.reuseIdentifier,
            for: indexPath
        ) as? TypographyCell ?? TypographyCell()

        let viewModel = cellsViewModels[indexPath.row]

        cell.configure(viewModel: viewModel)

        return cell
    }
}
