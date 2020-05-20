import SwiftUI

struct PlayingView: View {
    let board: Board
    let turn: Player
    let handle: (GameInput) -> Void
    
    var body: some View {
        VStack {
            Spacer()
            
            BoardView(board: board, handle: self.handle)
                .aspectRatio(1, contentMode: .fit)
                .padding()
            
            Spacer()
            
            Text("It's \(turn.rawValue)'s turn.")
                .padding()
        }
    }
}
