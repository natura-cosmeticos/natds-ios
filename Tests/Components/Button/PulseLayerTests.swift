import XCTest
@testable import NatDS

class PulseLayerTests: XCTestCase {

    var sut: PulseLayer!

    override func setUp() {
        super.setUp()

        sut = PulseLayer()

    }

    func test_startPulse_expectedPulseLayerEqualsToLayer() {
        let layer = CALayer()
        layer.bounds = CGRect(x: 0, y: 0, width: 0, height: 0)
        layer.addSublayer(sut)

        sut.startPulseAt(point: CGPoint(x: 0, y: 0))

        XCTAssertEqual(layer.opacity, 1)
        XCTAssertEqual(layer.bounds, layer.bounds)
    }

    func test_endPulse_expectedPulseLayerWasRemoved() {

        let expectation = self.expectation(description: "calls the callback with a resource object")

        let layer = CALayer()
        layer.bounds = CGRect(x: 0, y: 0, width: 0, height: 0)
        layer.addSublayer(sut)

        sut.startPulseAt(point: CGPoint(x: 0, y: 0))
        sut.endPulse()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            XCTAssertNil(layer.sublayers)
            expectation.fulfill()
        }

        self.waitForExpectations(timeout: 0.5, handler: .none)
    }
}
