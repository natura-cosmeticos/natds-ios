import Quick
import Nimble

@testable import NatDS

final class PulseContainerLayerSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: PulseContainerLayer!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubThemeProtocol()

            systemUnderTest = PulseContainerLayer(color: NatColors.highlight)
        }

        describe("#init") {
            it("sets masksToBounds to true") {
                expect(systemUnderTest.masksToBounds).to(beTrue())
            }

            it("sets PulseLayer as sublayer") {
                let pulseLayer = systemUnderTest.sublayers?.first as? PulseLayer

                expect(pulseLayer).toNot(beNil())
            }

            it("sets a color to PulseLayer") {
                let pulseLayer = systemUnderTest.sublayers?.first as? PulseLayer
                let expectedColor = NatColors.highlight.cgColor

                expect(pulseLayer?.fillColor).to(equal(expectedColor))
            }
        }

        describe("#frame") {
            it("sets pulseLayer.frame") {
                let cgRect = CGRect(
                    origin: .init(x: 0, y: 0),
                    size: .init(width: 100, height: 200)
                )

                let pulseLayer = systemUnderTest.sublayers?.first as? PulseLayer

                systemUnderTest.frame = cgRect

                expect(systemUnderTest?.bounds).to(equal(pulseLayer?.frame))
            }
        }
    }
}
