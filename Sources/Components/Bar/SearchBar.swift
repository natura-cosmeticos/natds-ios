import Foundation

public class SearchBar: UISearchBar {

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

        createSearchBar()
        let searchTextField = searchTextFieldSetup()
        searchClearButtonSetup(textField: searchTextField)
    }

    private func createSearchBar() {
        self.backgroundColor = .clear
        self.tintColor = Colors.Content.highEmphasis
        self.searchBarStyle = .minimal
        self.autocapitalizationType = .allCharacters
        self.setImage(UIImage(), for: .search, state: .normal)
        self.setPositionAdjustment(UIOffset(horizontal: 0, vertical: 0), for: .search)
    }

    private func searchTextFieldSetup() -> UITextField? {

        guard let textField = self.value(forKey: "searchField") as? UITextField else {
            return nil
        }

        textField.backgroundColor = .white
        textField.clearButtonMode = .whileEditing
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
        button.setTitle(NatDS.Icon.outlinedNavigationClose.rawValue, for: .normal)
    }
}
