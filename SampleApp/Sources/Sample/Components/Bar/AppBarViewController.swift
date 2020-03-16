import UIKit
import NatDS

class AppBarViewController: UIViewController, SampleItem {
    static var name: String = "App Bar"

    private lazy var appSearchBar: SearchBar = {
        let appSearchBar = SearchBar()
        appSearchBar.placeholder = "Type some text"
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
        navigationItem.titleView = appSearchBar
    }
}
