enum Player: String {
    case one = "Player one"
    case two = "Player two"
    
    var other: Player {
        (self == .one)
            ? .two
            : .one
    }
}
