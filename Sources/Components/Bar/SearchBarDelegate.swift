@objc public protocol SearchBarDelegate: AnyObject {
    @objc optional func natSearchBarDidBeginEditing(_ searchBar: SearchBar)
    @objc optional func natSearchBarDidEndEditing(_ searchBar: SearchBar)
    @objc optional func natSearchBar(_ searchBar: SearchBar, textDidChange searchText: String)
}
