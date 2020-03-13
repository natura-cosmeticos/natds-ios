import Foundation

public class SearchBar: UIView {

    public weak var delegate: SearchBarDelegate?

    public var placeholder: String? {
        get { searchBar.placeholder }
        set { searchBar.placeholder = newValue}
    }

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.alignment = .fill
        return stackView
    }()

    public private(set) lazy var leftButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .iconFont()
        button.setTitle(Icon.outlinedNavigationDirectionright.rawValue, for: .normal)
        button.setTitleColor(Colors.Content.highlight, for: .normal)
        return button
    }()

    private(set) lazy var searchBar: UISearchBar = {
        let searchBar = createSearchBar()
        let searchTextField = searchTextFieldSetup(searchBar: searchBar)
        searchClearButtonSetup(textField: searchTextField)
        return searchBar
    }()

    private(set) lazy var divider: Divider = {
        return Divider()
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
        addStackView()
        stackView.addArrangedSubview(leftButton)
        stackView.addArrangedSubview(searchBar)
        addDivider()
    }

    private func addStackView() {
        self.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 56)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    private func addDivider() {
        self.addSubview(divider)
        divider.translatesAutoresizingMaskIntoConstraints = false

        let contraints = [
            divider.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8),
            divider.leadingAnchor.constraint(equalTo: leadingAnchor),
            divider.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]

        NSLayoutConstraint.activate(contraints)
    }

    private func createSearchBar() -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.backgroundColor = .clear
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
        textField.borderStyle = .none
        textField.keyboardType = .default

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
