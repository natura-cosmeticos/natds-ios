import Quick
import Nimble

@testable import NatDS

final class NatCardSpec: QuickSpec {
    override func spec() {
        var systemUnderTest: NatCard!

        describe("#init") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = StubTheme()

                systemUnderTest = NatCard()
            }

            it("returns an expected backgroundColor") {
                expect(systemUnderTest.backgroundColor).to(equal(getUIColorFromTokens(\.colorSurface)))
            }

            it("returns an expected border radius") {
                systemUnderTest.configure(borderRadius: true)
                expect(systemUnderTest.layer.cornerRadius).to(equal(getTokenFromTheme(\.borderRadiusMedium)))
            }

            it("returns an expected elevation") {
                systemUnderTest.configure(elevation: true)
                expect(systemUnderTest.getElevationSet()).to(equal(NatElevation.ElevationAttributes.micro))
            }

            it("adds card") {
                let view = UIView()
                view.addSubview(systemUnderTest)
                expect(view.subviews.compactMap { $0 as? NatCard }.count).to(equal(1))
            }
        }
    }
}
