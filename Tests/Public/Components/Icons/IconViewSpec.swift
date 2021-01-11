import Quick
import Nimble

@testable import NatDS

final class IconViewSpec: QuickSpec {
    override func spec() {
        var sut: IconView!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()
        }

        describe("#init(fontSize: icon:)") {
            beforeEach {
                sut = IconView(fontSize: 25)
            }

            it("sets expected icon") {
                expect(sut.defaultImageView.isHidden).toNot(beTrue())
            }
        }
    }
}
