import UIKit
import NatDS

final class ChooseBrandViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: ChooseBrandHeader.reuseIdentifier
        )
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = NatColors.background
        tableView.register(ColorsHeader.self, forHeaderFooterViewReuseIdentifier: ChooseBrandHeader.reuseIdentifier)
        tableView.sectionHeaderHeight = 128

        return tableView
    }()

    private let brands = [
        "Avon",
        "Natura",
        "The Body Shop"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    private func setup() {
        title = "Choose a Brand"

        view.backgroundColor = NatColors.background
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
    }
}

extension ChooseBrandViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        20
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        brands.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChooseBrandHeader.reuseIdentifier, for: indexPath)

        cell.textLabel?.textColor = NatColors.onBackground
        cell.textLabel?.text = brands[indexPath.row]
        cell.selectionStyle = .none
        cell.backgroundColor = NatColors.background

        return cell
    }
}

extension ChooseBrandViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: ChooseBrandHeader.reuseIdentifier
            ) as? ChooseBrandHeader ?? ChooseBrandHeader()

        return headerCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            DesignSystem().configure(with: .avonLight)
        case 1:
            DesignSystem().configure(with: .naturaLight)
        case 2:
            DesignSystem().configure(with: .theBodyShopLight)
        default:
            fatalError("Not implemented")
        }

        let viewController = MainViewController()
        navigationController?.navigationBar.barTintColor = NatColors.primary
        navigationController?.navigationBar.tintColor = NatColors.onPrimary
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: NatColors.onPrimary
        ]
        navigationController?.pushViewController(viewController, animated: true)
    }
}


////

//import UIKit
//import NatDS

final class ChooseBrandHeader: UITableViewHeaderFooterView {

    // MARK: - Private properties

    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "NATDSBackground"))
        imageView.contentMode = .top
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private let overlayView: CustomSplashViewController.GradientBackgroundView = {
        let view = CustomSplashViewController.GradientBackgroundView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .heading6)
        label.text = "NATDS - iOS"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let versionLabel: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .caption)
        label.text = "version \(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "")"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        setup()
    }

    func setup() {
        contentView.backgroundColor = NatColors.background

        contentView.addSubview(backgroundImageView)
        contentView.addSubview(overlayView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(versionLabel)

        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            backgroundImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor),

            overlayView.widthAnchor.constraint(equalTo: backgroundImageView.widthAnchor),
            overlayView.heightAnchor.constraint(equalTo: backgroundImageView.heightAnchor),

//            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: NatSpacing.tiny),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            versionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: NatSpacing.tiny),
            versionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -NatSpacing.tiny),
            versionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ChooseBrandHeader: ReusableView {}
