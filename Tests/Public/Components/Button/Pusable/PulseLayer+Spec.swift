import Quick
import Nimble

@testable import NatDS

final class PulseLayerSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: PulseLayer!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()

            systemUnderTest = PulseLayer()
        }

        describe("#init") {
            it("sets masksToBounds to true") {
                expect(systemUnderTest.masksToBounds).to(beTrue())
            }

            it("sets a container as sublayer") {
                let containerLayer = systemUnderTest.sublayers?.first as? CAShapeLayer

                expect(containerLayer).toNot(beNil())
            }

            it("sets a default color to containerLayer") {
                let containerLayer = systemUnderTest.sublayers?.first as? CAShapeLayer
                let opacity = getTokenFromTheme(\.opacityDisabledLow)
                let expectedColor = NatColors.highlight.withAlphaComponent(opacity).cgColor

                expect(containerLayer?.fillColor).to(equal(expectedColor))
            }
        }

        describe("#frame") {
            it("sets containerLayer.frame") {
                let cgRect = CGRect(
                    origin: .init(x: 0, y: 0),
                    size: .init(width: 100, height: 200)
                )
                let containerLayer = systemUnderTest.sublayers?.first as? CAShapeLayer

                systemUnderTest.frame = cgRect

                expect(containerLayer?.frame).to(equal(cgRect))
            }
        }

        describe("#fillColor") {
            it("sets containerLayer.fillColor") {
                let containerLayer = systemUnderTest.sublayers?.first as? CAShapeLayer

                systemUnderTest.fillColor = UIColor.red.cgColor

                expect(containerLayer?.fillColor).to(equal(UIColor.red.cgColor))
            }
        }
    }
}
