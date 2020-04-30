struct AvonSpacing: Spacing {
    let micro: CGFloat
    let tiny: CGFloat
    let small: CGFloat
    let standart: CGFloat
    let semi: CGFloat
    let large: CGFloat
    let xLarge: CGFloat

    init() {
        let spacing: CGFloat = 8
        
        micro = spacing / 2
        tiny = spacing
        small = spacing * 2
        standart = spacing * 3
        semi = spacing * 4
        large = spacing * 6
        xLarge = spacing * 8
    }
}
