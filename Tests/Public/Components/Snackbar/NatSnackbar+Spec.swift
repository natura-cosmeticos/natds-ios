import Quick
import Nimble

@testable import NatDS

final class SnackbarSpec: QuickSpec {

    override func spec() {
        var systemUnderTest: NatSnackbar!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()
            systemUnderTest = NatSnackbar()
        }

        describe("#configure(body:)") {
            context("with value") {
                beforeEach {
                    systemUnderTest.configure(body: "with value")
                }

                it("description text with value") {
                    expect(systemUnderTest.bodyLabel.text).toEventually(equal("with value"))
                }
            }
        }

        describe("#configure(icon:)") {
            context("nil") {
                beforeEach {
                    systemUnderTest.configure(icon: nil)
                }

                it("title text nil") {
                    expect(systemUnderTest.iconView.iconText).to(beNil())
                }
            }
            context("with value") {
                beforeEach {
                    systemUnderTest.configure(icon: "with value")
                }

                it("title text with value") {
                    expect(systemUnderTest.iconView.iconText).toEventually(equal("with value"))
                }
            }
        }

        describe("#configure(title:)") {
            context("with value") {
                beforeEach {
                    systemUnderTest.configure(title: "with value")
                }

                it("description text with value") {
                    expect(systemUnderTest.titleLabel.text).toEventually(equal("with value"))
                }
            }
        }
    }
}
