final class DynamicColors {
    private let dynamicColorFactory: DynamicColorFactory

    init(dynamicColorFactory: DynamicColorFactory) { self.dynamicColorFactory = dynamicColorFactory }

    lazy var primary = dynamicColorFactory.createDynamicColor(for: \.primary)
    lazy var onPrimary = dynamicColorFactory.createDynamicColor(for: \.onPrimary)
    lazy var primaryLight = dynamicColorFactory.createDynamicColor(for: \.primaryLight)
    lazy var onPrimaryLight = dynamicColorFactory.createDynamicColor(for: \.onPrimaryLight)
    lazy var primaryDark = dynamicColorFactory.createDynamicColor(for: \.primaryDark)
    lazy var onPrimaryDark = dynamicColorFactory.createDynamicColor(for: \.onPrimaryDark)
    lazy var secondary = dynamicColorFactory.createDynamicColor(for: \.secondary)
    lazy var onSecondary = dynamicColorFactory.createDynamicColor(for: \.onSecondary)
    lazy var secondaryLight = dynamicColorFactory.createDynamicColor(for: \.secondaryLight)
    lazy var onSecondaryLight = dynamicColorFactory.createDynamicColor(for: \.onSecondaryLight)
    lazy var secondaryDark = dynamicColorFactory.createDynamicColor(for: \.secondaryDark)
    lazy var onSecondaryDark = dynamicColorFactory.createDynamicColor(for: \.onSecondaryDark)
    lazy var background = dynamicColorFactory.createDynamicColor(for: \.background)
    lazy var onBackground = dynamicColorFactory.createDynamicColor(for: \.onBackground)
    lazy var surface = dynamicColorFactory.createDynamicColor(for: \.surface)
    lazy var onSurface = dynamicColorFactory.createDynamicColor(for: \.onSurface)
    lazy var highlight = dynamicColorFactory.createDynamicColor(for: \.highlight)
    lazy var highEmphasis = dynamicColorFactory.createDynamicColor(for: \.highEmphasis)
    lazy var mediumEmphasis = dynamicColorFactory.createDynamicColor(for: \.mediumEmphasis)
    lazy var lowEmphasis = dynamicColorFactory.createDynamicColor(for: \.lowEmphasis)
    lazy var success = dynamicColorFactory.createDynamicColor(for: \.success)
    lazy var onSuccess = dynamicColorFactory.createDynamicColor(for: \.onSuccess)
    lazy var warning = dynamicColorFactory.createDynamicColor(for: \.warning)
    lazy var onWarning = dynamicColorFactory.createDynamicColor(for: \.onWarning)
    lazy var alert = dynamicColorFactory.createDynamicColor(for: \.alert)
    lazy var onAlert = dynamicColorFactory.createDynamicColor(for: \.onAlert)
    lazy var link = dynamicColorFactory.createDynamicColor(for: \.link)
    lazy var onLink = dynamicColorFactory.createDynamicColor(for: \.onLink)
}
