import UIKit
import NatDS

class ImageViewController: UIViewController, SampleItem {
    static var name = "Image"

    private let cellsViewModel: [ImageCell.ViewModel] = [
        ("Variant Standard", .standard, .none, nil),
        ("Variant Highlight", .highlight, .none, nil),
        ("Radius None", .standard, .none, nil),
        ("Radius Medium", .standard, .medium, nil),
        ("Radius Circle", .standard, .circle(imageHeight: 80), nil),
        ("Fade Top", .standard, .medium, .top),
        ("Fade Bottom", .standard, .medium, .bottom),
        ("Fade Left", .standard, .medium, .left),
        ("Fade Right", .standard, .medium, .right)
    ]

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ImageCell.self, forCellReuseIdentifier: ImageCell.reuseIdentifier)
        tableView.backgroundColor = NatColors.background
        tableView.rowHeight = 96
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    override func viewDidLoad() {
        title = Self.name
        view.backgroundColor = NatColors.background

        setup()
    }

    private func setup() {
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            tableView.rightAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.rightAnchor,
                constant: -8
            ),
            tableView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ),
            tableView.leftAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leftAnchor,
                constant: 8
            )
        ])
    }
}

extension ImageViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellsViewModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ImageCell.reuseIdentifier,
            for: indexPath
        ) as? ImageCell ?? ImageCell()

        cell.configure(viewModel: cellsViewModel[indexPath.item])
        return cell
    }
}
