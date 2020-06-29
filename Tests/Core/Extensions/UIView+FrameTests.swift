import XCTest
@testable import NatDS

class UIViewFrameTests: XCTestCase {

    func test_getX_expectedValueForX() {
        let expectedValueForX: CGFloat = 10
        let view = UIView(frame: CGRect(x: expectedValueForX, y: 20, width: 100, height: 200))

        XCTAssertEqual(view.x, expectedValueForX)
    }

    func test_getY_expectedValueForY() {
        let expectedValueForY: CGFloat = 20
        let view = UIView(frame: CGRect(x: 10, y: expectedValueForY, width: 100, height: 200))

        XCTAssertEqual(view.y, expectedValueForY)
    }

    func test_getWidth_expectedValueForWidth() {
        let expectedValueForWidth: CGFloat = 100
        let view = UIView(frame: CGRect(x: 10, y: 20, width: expectedValueForWidth, height: 200))

        XCTAssertEqual(view.width, expectedValueForWidth)
    }

    func test_getHeight_expectedValueForHeight() {
        let expectedValueForHeight: CGFloat = 200
        let view = UIView(frame: CGRect(x: 10, y: 20, width: 100, height: expectedValueForHeight))

        XCTAssertEqual(view.height, expectedValueForHeight)
    }

    func test_setX_expectedValueForX() {
        let expectedValueForX: CGFloat = 15
        let view = UIView(frame: CGRect(x: expectedValueForX, y: 25, width: 150, height: 250))

        view.x = expectedValueForX

        XCTAssertEqual(view.x, expectedValueForX)
    }

    func test_setY_expectedValueForY() {
        let expectedValueForY: CGFloat = 25
        let view = UIView(frame: CGRect(x: 15, y: expectedValueForY, width: 150, height: 250))

        view.y = expectedValueForY

        XCTAssertEqual(view.y, expectedValueForY)
    }

    func test_setWidth_expectedValueForWidth() {
        let expectedValueForWidth: CGFloat = 150
        let view = UIView(frame: CGRect(x: 15, y: 25, width: expectedValueForWidth, height: 250))

        view.width = expectedValueForWidth

        XCTAssertEqual(view.width, expectedValueForWidth)
    }

    func test_setHeight_expectedValueForHeight() {
        let expectedValueForHeight: CGFloat = 250
        let view = UIView(frame: CGRect(x: 15, y: 25, width: 150, height: expectedValueForHeight))

        view.height = expectedValueForHeight

        XCTAssertEqual(view.height, expectedValueForHeight)
    }

}
