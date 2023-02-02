import UIKit
import NatDS

class ImageViewController: UIViewController, SampleItem {
    static var name = "Image"

    private let cellsViewModel: [ImageCell.ViewModel] = [
        ImageCell.ViewModel(description: "Variant Standard", variant: .standard, radius: .none, fade: nil),
        ImageCell.ViewModel(description: "Variant Highlight", variant: .highlight, radius: .none, fade: nil),
        ImageCell.ViewModel(description: "Radius None", variant: .standard, radius: .none, fade: nil),
        ImageCell.ViewModel(description: "Radius Medium", variant: .standard, radius: .medium, fade: nil),
        ImageCell.ViewModel(description: "Radius Circle", variant: .standard, radius: .circle(imageHeight: 80), fade: nil),
        ImageCell.ViewModel(description: "Fade Top", variant: .standard, radius: .medium, fade: .top),
        ImageCell.ViewModel(description: "Fade Bottom", variant: .standard, radius: .medium, fade: .bottom),
        ImageCell.ViewModel(description: "Fade Left", variant: .standard, radius: .medium, fade: .left),
        ImageCell.ViewModel(description: "Fade Right", variant: .standard, radius: .medium, fade: .right)
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
