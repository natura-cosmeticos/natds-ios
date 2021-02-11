import Quick
import Nimble

@testable import NatDS

class ProgressIndicatorCircularSizeSpec: QuickSpec {
    override func spec() {
        DesignSystem().configure(with: .avonLight)
        let systemUnderTest = NatProgressIndicatorCircular.Size.self

        describe("#size") {
            it("standard") {
                let sut = systemUnderTest.standard
                expect(sut.value).to(equal(getTokenFromTheme(\.sizeStandard)))
            }

            it("semi") {
                let sut = systemUnderTest.semi
                expect(sut.value).to(equal(getTokenFromTheme(\.sizeSemi)))
            }

            it("medium") {
                let sut = systemUnderTest.medium
                expect(sut.value).to(equal(getTokenFromTheme(\.sizeMedium)))
            }

            it("large") {
                let sut = systemUnderTest.large
                expect(sut.value).to(equal(getTokenFromTheme(\.sizeLarge)))
            }
        }
    }
}
