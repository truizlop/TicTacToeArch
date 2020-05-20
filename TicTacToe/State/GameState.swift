enum GameState {
    case playing(Board, turn: Player)
    case finished(winner: Player)
    case draw
}
