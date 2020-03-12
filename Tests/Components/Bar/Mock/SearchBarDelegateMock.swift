import Foundation
@testable import NatDS

class SearchBarDelegateMock: SearchBarDelegate {

    var invokedDidBeginEditing: (count: Int, field: SearchBar?) = (count: 0, field: nil)
    var invokedDidEndEditing: (count: Int, field: SearchBar?) = (count: 0, field: nil)
    var invokedSearchBar: (count: Int, field: SearchBar?) = (count: 0, field: nil)

    func natSearchBarDidBeginEditing(_ searchBar: SearchBar) {
        invokedDidBeginEditing.count += 1
        invokedDidBeginEditing.field = searchBar
    }

    func natSearchBarDidEndEditing(_ searchBar: SearchBar) {
        invokedDidEndEditing.count += 1
        invokedDidEndEditing.field = searchBar
    }

    func natSearchBar(_ searchBar: SearchBar, textDidChange searchText: String) {
        invokedSearchBar.count += 1
        invokedSearchBar.field = searchBar
    }
}
