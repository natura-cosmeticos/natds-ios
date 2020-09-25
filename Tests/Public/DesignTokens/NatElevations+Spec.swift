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

                    expect(view.getElevationSet()).to(equal(elevations.elevationNone))
                }
            }

            describe("#elevation01") {
                it("returns an expected value") {
                    systemUnderTest.apply(on: view, elevation: .elevation01)

                    expect(view.getElevationSet()).to(equal(elevations.elevation01))
                }
            }

            describe("#elevation02") {
                it("returns an expected value") {
                    systemUnderTest.apply(on: view, elevation: .elevation02)

                    expect(view.getElevationSet()).to(equal(elevations.elevation02))
                }
            }

            describe("#elevation03") {
                it("returns an expected value") {
                    systemUnderTest.apply(on: view, elevation: .elevation03)

                    expect(view.getElevationSet()).to(equal(elevations.elevation03))
                }
            }

            describe("#elevation04") {
                it("returns an expected value") {
                    systemUnderTest.apply(on: view, elevation: .elevation04)

                    expect(view.getElevationSet()).to(equal(elevations.elevation04))
                }
            }

            describe("#elevation05") {
                it("returns an expected value") {
                    systemUnderTest.apply(on: view, elevation: .elevation05)

                    expect(view.getElevationSet()).to(equal(elevations.elevation05))
                }
            }

            describe("#elevation06") {
                it("returns an expected value") {
                    systemUnderTest.apply(on: view, elevation: .elevation06)

                    expect(view.getElevationSet()).to(equal(elevations.elevation06))
                }
            }

            describe("#elevation07") {
                it("returns an expected value") {
                    systemUnderTest.apply(on: view, elevation: .elevation07)

                    expect(view.getElevationSet()).to(equal(elevations.elevation07))
                }
            }

            describe("#elevation08") {
                it("returns an expected value") {
                    systemUnderTest.apply(on: view, elevation: .elevation08)

                    expect(view.getElevationSet()).to(equal(elevations.elevation08))
                }
            }

            describe("#elevation09") {
                it("returns an expected value") {
                    systemUnderTest.apply(on: view, elevation: .elevation09)

                    expect(view.getElevationSet()).to(equal(elevations.elevation09))
                }
            }

            describe("#elevation010") {
                it("returns an expected value") {
                    systemUnderTest.apply(on: view, elevation: .elevation10)

                    expect(view.getElevationSet()).to(equal(elevations.elevation10))
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
