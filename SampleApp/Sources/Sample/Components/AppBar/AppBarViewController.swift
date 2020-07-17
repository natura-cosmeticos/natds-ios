import NatDS
import UIKit

class AppBarViewController: UIViewController, SampleItem {
    static var name: String = "App Bar"

    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("AppBar", for: .normal)
        button.titleLabel?.textColor = UIColor.black

        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = Self.name

        setup()
    }

    // MARK: - Private methods

    private func setup() {
        view.backgroundColor = NatColors.background

        view.addSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.addTarget(self, action: #selector(openAppBar), for: .touchUpInside)
    }

    @objc func openAppBar() {
        let viewController = AppBarItemViewController()
        viewController.title = title
        viewController.view.backgroundColor = NatColors.background

        let appBarNavigationController = UINavigationController()
        appBarNavigationController.addChild(viewController)
        appBarNavigationController.configure(style: .default)
        navigationController?.present(appBarNavigationController, animated: true, completion: nil)
    }
}

class AppBarItemViewController: UIViewController {
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Detail", for: .normal)
        button.titleLabel?.textColor = UIColor.black

        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = NatColors.background

        view.addSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.addTarget(self, action: #selector(openDetail), for: .touchUpInside)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

//        navigationController?.configure(style: .default)
    }

    @objc func openDetail() {
        let detailViewController = AppBarDetailViewController()

        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

class AppBarDetailViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(highlight: .image)
        view.backgroundColor = NatColors.background
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)



        let button = UIBarButtonItem(icon: .filledMediaPlay, action: #selector(buttonAction), target: self)

        configure(button: [button])
    }

    @objc func buttonAction() {
        print("Action executed")
    }
}
