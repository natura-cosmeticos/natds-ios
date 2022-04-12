import Quick
import Nimble

@testable import NatDS

final class PulsableSpec: QuickSpec {
    override func spec() {
        var pulsableButtonStub: PulsableButtonStub!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()

            pulsableButtonStub = PulsableButtonStub(
                frame: .init(
                    origin: .init(x: 0, y: 0),
                    size: .init(width: 100, height: 200)
                )
            )
        }

        describe("#beginPulseAt") {
            var pulseContainerLayer: PulseLayer!

            beforeEach {
                pulsableButtonStub.touchesBegan(.init(arrayLiteral: .init()), with: nil)
                pulseContainerLayer = pulsableButtonStub.layer.sublayers?.first as? PulseLayer
            }

            it("inserts PulseContainerLayer as sublayer") {
                expect(pulseContainerLayer).toEventuallyNot(beNil())
            }

            it("sets the same cornerRadius to pulseContainerLayer") {
                expect(pulseContainerLayer?.cornerRadius).toEventually(equal(pulsableButtonStub.layer.cornerRadius))
            }

            it("sets bounds to pulseContainerLayer.frame") {
                expect(pulseContainerLayer?.frame).toEventually(equal(pulsableButtonStub.layer.bounds))
            }
        }

        describe("#endPulse") {
            beforeEach {
                pulsableButtonStub.touchesBegan(.init(arrayLiteral: .init()), with: nil)
                pulsableButtonStub.touchesEnded(.init(), with: nil)
            }

            it("removes PulseContainerLayer after animation ends") {
                expect(pulsableButtonStub.layer.sublayers).toEventually(beNil())
            }
        }
    }
}

private class PulsableButtonStub: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)

        layer.cornerRadius = 15
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        if let touch = touches.first {
            let point = touch.location(in: self)
            addPulseLayerAnimated(at: point, in: layer, removeAfterAnimation: false)
        }
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)

        removePulseLayer(layer: layer)
    }
}

extension PulsableButtonStub: Pulsable {}
