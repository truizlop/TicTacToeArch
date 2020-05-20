import SwiftUI

struct GameView: View {
    let state: GameState
    let handle: (GameInput) -> Void
    
    var body: some View {
        switch state {
            
        case let .playing(board, turn: turn):
            return AnyView(PlayingView(board: board, turn: turn, handle: handle))
            
        case .finished(winner: let winner):
            return AnyView(WinnerView(winner: winner, handle: handle))
            
        case .draw:
            return AnyView(DrawView(handle: handle))
        }
    }
}
