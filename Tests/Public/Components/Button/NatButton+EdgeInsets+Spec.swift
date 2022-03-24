import Quick
import Nimble

@testable import NatDS

final class NatButtonEdgeInsetsSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatButton.EdgeInsets.self

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()
        }

        describe("#small") {
            it("returns expected edgeInsets") {
                let edgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
                expect(systemUnderTest.small).to(equal(edgeInsets))
            }
        }

        describe("#medium") {
            it("returns expected edgeInsets") {
                let edgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
                expect(systemUnderTest.medium).to(equal(edgeInsets))
            }
        }

        describe("#large") {
            it("returns expected edgeInsets") {
                let edgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
                expect(systemUnderTest.large).to(equal(edgeInsets))
            }
        }
    }
}
