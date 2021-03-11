import Quick
import Nimble

@testable import NatDS

final class NatAvatarStylesSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatAvatar.Types.self
        
        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()
        }
        
        describe("#all types") {
            it("has 3 possible sizes") {
                expect(systemUnderTest.allCases.count).to(equal(3))
            }
        }
    }
}
