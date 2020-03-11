import UIKit
import NatDS

class AppBarViewController: UIViewController, SampleItem {
    static var name: String = "App Bar"

    private lazy var searchBar: SearchBar = {
        let searchBar = SearchBar()
        searchBar.placeholder = "Type some text"
        searchBar.delegate = self

        return searchBar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        title = Self.name
        view.backgroundColor = .white

        addSearchBar()
    }

    private func addSearchBar() {
        view.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            searchBar.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            searchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchBar.heightAnchor.constraint(greaterThanOrEqualToConstant: 48)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}

extension AppBarViewController: SearchBarDelegate {

    public func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("DidBeginEditing")
    }

    public func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("DidBEndEditing")
    }

    public func natSearchBar(_ searchBar: SearchBar, textDidChange searchText: String) {
        print("natSearchBar: \(searchText)")
    }
}
