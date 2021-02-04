import Quick
import Nimble

@testable import NatDS

final class NatElevationsSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatElevation.self
        var view: UIView!

        let elevations = NatElevation.ElevationAttributes.self

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()
            view = .init(frame: .init(x: 0, y: 0, width: 200, height: 200))
        }

        describe("#applyElevation") {
            describe("#none") {
                it("returns an expected value") {
                    systemUnderTest.apply(on: view, elevation: .none)

                    expect(view.getElevationSet()).to(equal(elevations.none))
                }
            }

            describe("#micro") {
                it("returns an expected value") {
                    systemUnderTest.apply(on: view, elevation: .micro)

                    expect(view.getElevationSet()).to(equal(elevations.micro))
                }
            }

            describe("#tiny") {
                it("returns an expected value") {
                    systemUnderTest.apply(on: view, elevation: .tiny)

                    expect(view.getElevationSet()).to(equal(elevations.tiny))
                }
            }

            describe("#small") {
                it("returns an expected value") {
                    systemUnderTest.apply(on: view, elevation: .small)

                    expect(view.getElevationSet()).to(equal(elevations.small))
                }
            }

            describe("#medium") {
                it("returns an expected value") {
                    systemUnderTest.apply(on: view, elevation: .medium)

                    expect(view.getElevationSet()).to(equal(elevations.medium))
                }
            }

            describe("#large") {
                it("returns an expected value") {
                    systemUnderTest.apply(on: view, elevation: .large)

                    expect(view.getElevationSet()).to(equal(elevations.large))
                }
            }

            describe("#largeX") {
                it("returns an expected value") {
                    systemUnderTest.apply(on: view, elevation: .largeX)

                    expect(view.getElevationSet()).to(equal(elevations.largeX))
                }
            }

            describe("#largeXX") {
                it("returns an expected value") {
                    systemUnderTest.apply(on: view, elevation: .largeXX)

                    expect(view.getElevationSet()).to(equal(elevations.largeXX))
                }
            }

            describe("#huge") {
                it("returns an expected value") {
                    systemUnderTest.apply(on: view, elevation: .huge)

                    expect(view.getElevationSet()).to(equal(elevations.huge))
                }
            }

            describe("#hugeX") {
                it("returns an expected value") {
                    systemUnderTest.apply(on: view, elevation: .hugeX)

                    expect(view.getElevationSet()).to(equal(elevations.hugeX))
                }
            }

            describe("#hugeXX") {
                it("returns an expected value") {
                    systemUnderTest.apply(on: view, elevation: .hugeXX)

                    expect(view.getElevationSet()).to(equal(elevations.hugeXX))
                }
            }
        }
    }
}

internal extension UIView {
    func getElevationSet() -> NatElevation.ElevationAttributes {
        .init(
            shadowColor: layer.shadowColor,
            shadowOffSet: layer.shadowOffset,
            shadowRadius: layer.shadowRadius,
            shadowOpacity: layer.shadowOpacity
        )
    }
}
