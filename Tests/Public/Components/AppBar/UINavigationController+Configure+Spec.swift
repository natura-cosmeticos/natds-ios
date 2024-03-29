import Nimble
import Quick

@testable import NatDS

final class UINavigationControllerConfigureSpec: QuickSpec {
    override func spec() {
        var sut: UINavigationController!
        var color: AppBarColor!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()

            sut = UINavigationController()
            color = .default
        }

        // swiftlint:disable line_length
        describe("configure(color:)") {
            beforeEach {
                sut.configure(appBarColor: color)
            }
            it("sets tintColor") {
                expect(sut.navigationBar.tintColor).to(equal(color.contentColor))
            }
            it("sets barTintColor") {
                expect(sut.navigationBar.barTintColor).to(equal(color.backgroundColor))
            }
            it("sets titleTextAttributes") {
                if #available(iOS 15.0, *) {
                    if let foregroundColor = sut.navigationBar.standardAppearance.titleTextAttributes[NSAttributedString.Key.foregroundColor] as? UIColor {
                        expect(foregroundColor).to(equal(color.contentColor))
                    } else {
                        fail()
                    }
                } else {
                    if let foregroundColor = sut.navigationBar.titleTextAttributes?[NSAttributedString.Key.foregroundColor] as? UIColor {
                        expect(foregroundColor).to(equal(color.contentColor))
                    } else {
                        fail()
                    }
                }
            }
        }
        // swiftlint:enable line_length

        describe("configure(elevation:)") {
            context("when elevation is true") {
                beforeEach {
                    sut.configure(appBarElevation: true)
                }
                it("applies elevation") {
                    let attributes = NatElevation.ElevationAttributes.tiny

                    expect(sut.navigationBar.layer.shadowColor).to(equal(attributes.shadowColor))
                    expect(sut.navigationBar.layer.shadowOffset).to(equal(attributes.shadowOffSet))
                    expect(sut.navigationBar.layer.shadowRadius).to(equal(attributes.shadowRadius))
                    expect(sut.navigationBar.layer.shadowOpacity).to(equal(attributes.shadowOpacity))
                    expect(sut.navigationBar.layer.masksToBounds).to(beFalse())
                }
            }

            context("when elevation is false") {
                beforeEach {
                    sut.configure(appBarElevation: false)
                }
                it("removes elevation") {
                    let attributes = NatElevation.ElevationAttributes.none

                    expect(sut.navigationBar.layer.shadowColor).to(beNil())
                    expect(sut.navigationBar.layer.shadowOffset).to(equal(attributes.shadowOffSet))
                    expect(sut.navigationBar.layer.shadowRadius).to(equal(attributes.shadowRadius))
                    expect(sut.navigationBar.layer.shadowOpacity).to(equal(attributes.shadowOpacity))
                    expect(sut.navigationBar.layer.masksToBounds).to(beFalse())
                }
            }
        }
    }
}
