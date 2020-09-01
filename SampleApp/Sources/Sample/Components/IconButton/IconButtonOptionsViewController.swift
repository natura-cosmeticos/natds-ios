import UIKit
import NatDS

final class IconButtonOptionsViewController: UIViewController, SampleItem {
    static var name = "IconButton"
    private let variants: [IconButtonVariant] = IconButtonVariant.allCases
    private let attributes: [IconButtonAttribute] = IconButtonAttribute.allCases

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .clear
        tableView.register(UITableViewCell.self)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()

    init() {
        super.init(nibName: nil, bundle: nil)

        view.backgroundColor = NatColors.background

        setup()

        tableView.dataSource = self
        tableView.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods - UI

extension IconButtonOptionsViewController {
    private func setup() {
        view.addSubview(tableView)

        addConstraints()
    }

    private func addConstraints() {
        let constraints = [
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}

// MARK: - UITableViewDataSource

extension IconButtonOptionsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return variants.count
        case 1:
            return attributes.count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Variants"
        case 1:
            return "Attributes"
        default:
            return ""
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UITableViewCell.self)

        switch indexPath.section {
        case 0:
            let item = variants[indexPath.row]
            cell.textLabel?.text = item.title
        case 1:
            let item = attributes[indexPath.row]
            cell.textLabel?.text = item.title
        default:
            cell.textLabel?.text = ""
        }

        return cell
    }
}

 // MARK: - UITableViewDelegate

extension IconButtonOptionsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        switch indexPath.section {
        case 0:
            let variant = variants[indexPath.row]

            switch variant {
            case .standard:
                let iconButton = NatIconButton(style: .standardDefault)
                navigationController?.pushViewController(
                    IconButtonItemViewController(iconButton: iconButton),
                    animated: true
                )

            }
        case 1:
            let attribute = attributes[indexPath.row]
            var iconButton: NatIconButton

            switch attribute {
            case .colorPrimary:
                iconButton = NatIconButton(style: .standardPrimary)
            case .disabled:
                iconButton = NatIconButton(style: .standardDefault)
                iconButton.configure(state: .disabled)
            }

            navigationController?.pushViewController(
                IconButtonItemViewController(iconButton: iconButton),
                animated: true
            )
        default:
            return
        }
    }
}

enum IconButtonVariant: CaseIterable {
    case standard

    var title: String {
        switch self {
        case .standard: return "standard"
        }
    }
}

enum IconButtonAttribute: CaseIterable {
    case colorPrimary
    case disabled

    var title: String {
        switch self {
        case .colorPrimary: return "color primary"
        case .disabled: return "disabled"
        }
    }
}
