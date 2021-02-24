extension String {
    var initials: String {
        return self.components(separatedBy: " ")
            .filter { !$0.isEmpty }
            .reduce("") { ($0 == "" ? "" : "\($0.first!)") + "\($1.first!)" }
    }
}
