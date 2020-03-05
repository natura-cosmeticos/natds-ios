import XCTest
@testable import NatDS

class PulseTests: XCTestCase {

    var sut: Pulse!

    override func setUp() {
        sut = Pulse()
    }

    func test_beginPulseAt_returnsValidActivePulseLayer() {
        let layer = CALayer()
        layer.bounds = CGRect(x: 0, y: 0, width: 40, height: 40)

        sut.beginPulseAt(point: CGPoint(x: 0, y: 0), in: layer)

        XCTAssertNotNil(sut.activePulseLayer)
        XCTAssertEqual(sut.activePulseLayer?.bounds, layer.bounds)
        XCTAssertEqual(sut.activePulseLayer?.fillColor, Colors.Content.highEmphasis.withAlphaComponent(0.12).cgColor)
        XCTAssertTrue(layer.sublayers!.contains(sut.activePulseLayer!))
    }
}
