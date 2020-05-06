struct NaturaBorderRadius: BorderRadius {
    let small: CGFloat = 2
    let medium: CGFloat = 4
    let large: CGFloat = 8
    func circle(viewHeight: CGFloat) -> CGFloat { viewHeight / 2 }
}
