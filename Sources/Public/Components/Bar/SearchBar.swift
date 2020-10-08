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

    private var textField: UITextField? {
        guard let textField = self.value(forKey: "searchField") as? UITextField else {
            return nil
        }

        return textField
    }

    private func setup() {
        setupSearchBar()
        setupTextField()
        setupClearButton()
    }

    private func setupSearchBar() {
        self.backgroundColor = .clear
        self.tintColor = NatColors.highEmphasis
        self.searchBarStyle = .minimal
        self.autocapitalizationType = .allCharacters
        self.setImage(UIImage(), for: .search, state: .normal)
    }

    private func setupTextField() {
        guard let textField = self.textField else {
            return
        }

        textField.backgroundColor = NatColors.surface
        textField.textColor = NatColors.onSurface
        textField.clearButtonMode = .whileEditing
        textField.borderStyle = .none
        textField.keyboardType = .default
    }

    private func setupClearButton() {
        guard let button = textField?.value(forKey: "clearButton") as? UIButton else {
            return
        }

        button.titleLabel?.font = .iconFont()
        button.setTitle(NatDS.Icon.outlinedNavigationClose.unicode, for: .normal)
    }
}
