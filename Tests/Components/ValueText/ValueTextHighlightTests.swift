import FBSnapshotTestCase
@testable import NatDS

class ValueTextHighlightTests: FBSnapshotTestCase {

    var sut: ValueTextHighlight!
    var superview: UIView!

    override func setUp() {
        super.setUp()
        superview = UIView(frame: CGRect(x: 0, y: 0, width: 328, height: 100))
        superview.backgroundColor = .white
        sut = ValueTextHighlight(frame: CGRect(x: 0, y: 10, width: 328, height: 80))
        sut.backgroundColor = .white
        superview.addSubview(sut)
    }

    func test_init_hasValidSnapshot() {
        sut.valueDescription = "Você está transferindo"
        sut.value = "R$ 43,00"
        FBSnapshotVerifyView(superview)
    }

    func test_valueDescription_expectSameValueAsValueDescriptionLabel() {
        sut.valueDescription = "Você está transferindo"
        let labelText = sut.valueDescriptionLabel.text

        XCTAssertEqual(sut.valueDescription, labelText)
    }

    func test_value_expectSameValueAsValueLabel() {
        sut.value = "R$ 43,00"
        let labelText = sut.valueLabel.text

        XCTAssertEqual(sut.value, labelText)
    }
}
