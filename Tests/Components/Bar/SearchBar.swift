import FBSnapshotTestCase
@testable import NatDS

class SearchBarTests: FBSnapshotTestCase {

    var delegateMock: SearchBarDelegateMock!
    var sut: SearchBar!

    override func setUp() {
        super.setUp()

        delegateMock = SearchBarDelegateMock()

        sut = SearchBar(frame: CGRect(x: 0, y: 0, width: 328, height: 99))
        sut.backgroundColor = .white
        sut.placeholder = "Type some text"
        sut.delegate = delegateMock
    }

    /*
    func test_state_whenHasNoFocus_returnEnableStateSnapshot() {
        sut.textFieldDidEndEditing(sut.textField)
        FBSnapshotVerifyView(sut)
    }

    func test_state_whenHasFocus_returnActiveStateSnapshot() {
        sut.textFieldDidBeginEditing(sut.textField)
        FBSnapshotVerifyView(sut)
    }

    func test_state_whenHasError_returnErrorStateSnapshot() {
        sut.error = "Error: Has an error"
        FBSnapshotVerifyView(sut)
    }

    func test_text_whenTextIsSet_expectedTextFieldIsFilledSnapshot() {
        sut.text = "999.999.999-99"
        FBSnapshotVerifyView(sut)
    }

    func test_type_whenTypeIsText_expectedTypeSetup() {
        let expectedType = TextFieldType.text
        sut.type = expectedType

        XCTAssertEqual(sut.textField.keyboardType, expectedType.keyboard)
        XCTAssertEqual(sut.textField.autocorrectionType, expectedType.autoCorrection)
        XCTAssertEqual(sut.textField.autocapitalizationType, expectedType.capitalization)
    }
    */

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
