import FBSnapshotTestCase
@testable import NatDS

class SearchBarTests: FBSnapshotTestCase {

    var delegateMock: SearchBarDelegateMock!
    var superview: UIView!
    var sut: SearchBar!

    override func setUp() {
        super.setUp()

        delegateMock = SearchBarDelegateMock()

        sut = SearchBar()
        sut.backgroundColor = .white
        sut.placeholder = "Type some text"
        sut.delegate = delegateMock

        superview = UIView(frame: CGRect(x: 0, y: 0, width: 328, height: 112))
        superview.backgroundColor = .white
        superview.addSubview(sut)

        sut.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            sut.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            sut.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            sut.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            sut.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    func test_state_whenHasNoFocus_expectPlaceholderMessageWithoutCleanButton() {
        FBSnapshotVerifyView(superview)
    }

    func test_state_whenHasText_expectedCleanButtonIsVisible() {
        sut.searchBar.text = "NAT NATURA"
        FBSnapshotVerifyView(superview)
    }

    func test_searchBarDelegate_whenHasDelegateAndCallDidBeginEditing_expectInvokeSearchBarDelegate() {
        sut.searchBarTextDidBeginEditing(sut.searchBar)

        XCTAssertEqual(delegateMock.invokedDidBeginEditing.count, 1)
        XCTAssertEqual(delegateMock.invokedDidBeginEditing.field, sut)
    }

    func test_searchBarDelegate_whenHasDelegateAndCallDidEndEditing_expectInvokeSearchBarDelegate() {
        sut.searchBarTextDidEndEditing(sut.searchBar)

        XCTAssertEqual(delegateMock.invokedDidEndEditing.count, 1)
        XCTAssertEqual(delegateMock.invokedDidEndEditing.field, sut)
    }

    func test_searchBarDelegate_whenHasDelegateAndCallShouldChangeCharacterInRange_expectInvokeSearchBarDelegate() {
        sut.searchBar(sut.searchBar, textDidChange: "")

        XCTAssertEqual(delegateMock.invokedSearchBar.count, 1)
        XCTAssertEqual(delegateMock.invokedSearchBar.field, sut)
    }
}
