import Foundation

public class SearchBar: UIView {

    public weak var delegate: SearchBarDelegate?

    public var placeholder: String? {
        get { searchBar.placeholder }
        set { searchBar.placeholder = newValue}
    }

    private(set) lazy var searchBar: UISearchBar = {
        let searchBar = createSearchBar()
        let searchTextField = searchTextFieldSetup(searchBar: searchBar)
        searchClearButtonSetup(textField: searchTextField)

        return searchBar
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension SearchBar {

    private func setup() {
        self.backgroundColor = .clear
        addSearchField()
    }

    private func addSearchField() {

        self.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false

        let contraints = [
            searchBar.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 56)
        ]

        NSLayoutConstraint.activate(contraints)
    }

    private func createSearchBar() -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.backgroundColor = .white
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .allCharacters
        searchBar.setImage(UIImage(), for: .search, state: .normal)
        searchBar.setPositionAdjustment(UIOffset(horizontal: 0, vertical: 0), for: .search)
        searchBar.delegate = self

        return searchBar
    }

    private func searchTextFieldSetup(searchBar: UISearchBar) -> UITextField? {

        guard let textField = searchBar.value(forKey: "searchField") as? UITextField else {
            return nil
        }

        textField.backgroundColor = .white
        textField.clearButtonMode = .always
        textField.placeholder = "ESCOLHA UM BANCO"
        textField.text = "lero lero lero"
        textField.borderStyle = .none

        return textField
    }

    private func searchClearButtonSetup(textField: UITextField?) {

        guard let button = textField?.value(forKey: "clearButton") as? UIButton else {
            return
        }

        button.setImage(UIImage(), for: .normal)
        button.titleLabel?.font = .iconFont()
        button.setTitle(Icon.outlinedNavigationClose.rawValue, for: .normal)
        button.setTitleColor(Colors.Content.highlight, for: .normal)
    }
}

extension SearchBar: UISearchBarDelegate {

    public func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        delegate?.natSearchBarDidBeginEditing?(self)
    }

    public func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        delegate?.natSearchBarDidEndEditing?(self)
    }

    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        delegate?.natSearchBar?(self, textDidChange: searchText)
    }
}
