import Quick
import Nimble

@testable import NatDS

final class AlertSpec: QuickSpec {

    override func spec() {
        var systemUnderTest: NatAlert!

        beforeEach {
            ConfigurationStorage.shared.currentTheme = StubTheme()
            systemUnderTest = NatAlert()
        }

        describe("#configure(titleText:)") {
            context("nil") {
                beforeEach {
                    systemUnderTest.configure(titleText: nil)
                }

                it("title text nil") {
                    expect(systemUnderTest.titleText).to(beNil())
                }
            }
            context("with value") {
                beforeEach {
                    systemUnderTest.configure(titleText: "with value")
                }

                it("title text with value") {
                    expect(systemUnderTest.titleText).toEventually(equal("with value"))
                }
            }
        }
        
        describe("#configure(descriptionText:)") {
            context("nil") {
                beforeEach {
                    systemUnderTest.configure(descriptionText: nil)
                }

                it("description text nil") {
                    expect(systemUnderTest.descriptionText).to(beNil())
                }
            }
            context("with value") {
                beforeEach {
                    systemUnderTest.configure(descriptionText: "with value")
                }

                it("description text with value") {
                    expect(systemUnderTest.descriptionText).toEventually(equal("with value"))
                }
            }
        }
        
        describe("#configure(primaryButtonTitle:)") {
            context("empty") {
                beforeEach {
                    systemUnderTest.configure(primaryButtonTitle: "")
                }

                it("description text empty") {
                    expect(systemUnderTest.primaryButtonTitle).to(beEmpty())
                }
            }
            context("with value") {
                beforeEach {
                    systemUnderTest.configure(primaryButtonTitle: "with value")
                }

                it("description text with value") {
                    expect(systemUnderTest.primaryButtonTitle).toEventually(equal("with value"))
                }
            }
        }
        
        describe("#configure(secondaryButtonTitle:)") {
            context("empty") {
                beforeEach {
                    systemUnderTest.configure(secondaryButtonTitle: "")
                }

                it("description text empty") {
                    expect(systemUnderTest.secondaryButtonTitle).to(beEmpty())
                }
            }
            context("with value") {
                beforeEach {
                    systemUnderTest.configure(secondaryButtonTitle: "with value")
                }

                it("description text with value") {
                    expect(systemUnderTest.secondaryButtonTitle).toEventually(equal("with value"))
                }
            }
        }
        
        describe("#configure(showIcon:)") {
            context("is false") {
                beforeEach {
                    systemUnderTest.configure(showIcon: false)
                }

                it("icon is not showing") {
                    let iconView = systemUnderTest.subviews
                        .compactMap { $0 as? IconView }
                        .first

                    expect(iconView?.isHidden).to(beTrue())
                }

                context("icon is showing") {
                    beforeEach {
                        systemUnderTest.configure(showIcon: true)
                    }

                    it("adds icon to the left side") {
                        let iconView = systemUnderTest.subviews
                            .compactMap { $0 as? IconView }
                            .first

                        expect(iconView?.isHidden).to(beFalse())
                    }
                }
            }
        }
    }
}


