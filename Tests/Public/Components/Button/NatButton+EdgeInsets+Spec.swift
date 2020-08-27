import Quick
import Nimble

@testable import NatDS

final class NatButtonEdgeInsetsSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatButton.EdgeInsets.self

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubThemeProtocol()
        }

        describe("#small") {
            it("returns expected edgeInsets") {
                expect(systemUnderTest.small).to(equal(.init(top: 8, left: 8, bottom: 8, right: 8)))
            }
        }

        describe("#medium") {
            it("returns expected edgeInsets") {
                expect(systemUnderTest.medium).to(equal(.init(top: 12, left: 12, bottom: 12, right: 12)))
            }
        }

        describe("#large") {
            it("returns expected edgeInsets") {
                expect(systemUnderTest.large).to(equal(.init(top: 16, left: 16, bottom: 16, right: 16)))
            }
        }
    }
}
