import Bow
import BowArch

typealias GameDispatcher = StateDispatcher<Any, GameState, GameInput>

let gameDispatcher = GameDispatcher.pure { input in
    switch input {
    case let .tapTile(x, y):
        return tapTile(x, y)
    case .tapPlayAgain:
        return newGame()
    }
}

func tapTile(
    _ x: Board.VerticalPosition,
    _ y: Board.HorizontalPosition
) -> State<GameState, Void> {
    .modify { state in
        switch state {
        case let .playing(board, turn: turn):
            if board[x, y] == .empty {
                let newBoard = board.set(value: .used(turn), at: x, y)
                if let winner = newBoard.checkWinner() {
                    return .finished(winner: winner)
                } else if !newBoard.hasEmptySpaces {
                    return .draw
                } else {
                    return .playing(newBoard, turn: turn.other)
                }
            } else {
                return state
            }
        case .finished, .draw:
            return state
        }
    }^
}

func newGame() -> State<GameState, Void> {
    .set(
        GameState.playing(Board(), turn: .one)
    )^
}
