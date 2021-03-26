import Quick
import Nimble

@testable import NatDS

final class NatCounterSpec: QuickSpec {

    override func spec() {
        var sut: NatCounter!

        describe("#init") {
            context("when it starts without text") {
                beforeEach {
                    ConfigurationStorage.shared.currentTheme = StubTheme()

                    sut = NatCounter()
                }

                it("starts enabled") {
                    sut.configure(isEnabled: true)
                    expect(sut.checkbox.isEnabled).to(equal(true))
                }
            }
        }
    }
}
