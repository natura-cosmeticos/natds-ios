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

            describe("#elevation01") {
                it("returns an expected value") {
                    systemUnderTest.apply(on: view, elevation: .elevation01)

                    expect(view.getElevationSet()).to(equal(elevations.micro))
                }
            }

            describe("#elevation02") {
                it("returns an expected value") {
                    systemUnderTest.apply(on: view, elevation: .elevation02)

                    expect(view.getElevationSet()).to(equal(elevations.tiny))
                }
            }

            describe("#elevation03") {
                it("returns an expected value") {
                    systemUnderTest.apply(on: view, elevation: .elevation03)

                    expect(view.getElevationSet()).to(equal(elevations.small))
                }
            }

            describe("#elevation04") {
                it("returns an expected value") {
                    systemUnderTest.apply(on: view, elevation: .elevation04)

                    expect(view.getElevationSet()).to(equal(elevations.medium))
                }
            }

            describe("#elevation05") {
                it("returns an expected value") {
                    systemUnderTest.apply(on: view, elevation: .elevation05)

                    expect(view.getElevationSet()).to(equal(elevations.large))
                }
            }

            describe("#elevation06") {
                it("returns an expected value") {
                    systemUnderTest.apply(on: view, elevation: .elevation06)

                    expect(view.getElevationSet()).to(equal(elevations.largeX))
                }
            }

            describe("#elevation07") {
                it("returns an expected value") {
                    systemUnderTest.apply(on: view, elevation: .elevation07)

                    expect(view.getElevationSet()).to(equal(elevations.largeXX))
                }
            }

            describe("#elevation08") {
                it("returns an expected value") {
                    systemUnderTest.apply(on: view, elevation: .elevation08)

                    expect(view.getElevationSet()).to(equal(elevations.huge))
                }
            }

            describe("#elevation09") {
                it("returns an expected value") {
                    systemUnderTest.apply(on: view, elevation: .elevation09)

                    expect(view.getElevationSet()).to(equal(elevations.hugeX))
                }
            }

            describe("#elevation010") {
                it("returns an expected value") {
                    systemUnderTest.apply(on: view, elevation: .elevation10)

                    expect(view.getElevationSet()).to(equal(elevations.hugeXX))
                }
            }
        }
    }
}

fileprivate extension UIView {
    func getElevationSet() -> NatElevation.ElevationAttributes {
        .init(
            shadowColor: layer.shadowColor,
            shadowOffSet: layer.shadowOffset,
            shadowRadius: layer.shadowRadius,
            shadowOpacity: layer.shadowOpacity
        )
    }
}
