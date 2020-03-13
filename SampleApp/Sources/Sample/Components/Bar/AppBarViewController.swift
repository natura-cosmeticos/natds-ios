import UIKit
import NatDS

class AppBarViewController: UIViewController, SampleItem {
    static var name: String = "App Bar"

    private lazy var appSearchBar: SearchBar = {
        let appSearchBar = SearchBar()
        appSearchBar.placeholder = "Type some text"
        appSearchBar.leftButton.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        appSearchBar.delegate = self

        return appSearchBar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    @IBAction func didTap() {
        self.navigationController?.popToRootViewController(animated: true)
    }

    private func setup() {
        title = Self.name
        view.backgroundColor = .white
        addSearchBar()
    }

    private func addSearchBar() {
        view.addSubview(appSearchBar)

        appSearchBar.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            appSearchBar.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            appSearchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appSearchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            appSearchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}

extension AppBarViewController: SearchBarDelegate {

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) { }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) { }

    func natSearchBar(_ searchBar: SearchBar, textDidChange searchText: String) { }
}
