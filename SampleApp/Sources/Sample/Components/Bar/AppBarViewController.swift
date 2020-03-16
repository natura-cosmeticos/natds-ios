import UIKit
import NatDS

class AppBarViewController: UIViewController, SampleItem {
    static var name: String = "Search Bar"

    private lazy var appSearchBar: SearchBar = {
        let appSearchBar = SearchBar()
        appSearchBar.placeholder = "Type some text"
        return appSearchBar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        title = Self.name
        view.backgroundColor = .white
        navigationItem.titleView = appSearchBar
    }
}
