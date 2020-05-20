import SwiftUI

struct DrawView: View {
    let handle: (GameInput) -> Void
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("It's a draw!")
            
            Button("Play again") {
                self.handle(.tapPlayAgain)
            }
            
            Spacer()
        }
    }
}
