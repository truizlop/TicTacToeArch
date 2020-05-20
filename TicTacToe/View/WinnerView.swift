import SwiftUI

struct WinnerView: View {
    let winner: Player
    let handle: (GameInput) -> Void
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("\(winner.rawValue) won the game!")
            
            Button("Play again") {
                self.handle(.tapPlayAgain)
            }
            
            Spacer()
        }
    }
}
