import SwiftUI

struct BoardView: View {
    let board: Board
    let handle: (GameInput) -> Void
    
    var body: some View {
        VStack {
            self.row(at: .top)
            self.row(at: .middle)
            self.row(at: .bottom)
        }
    }
    
    var isOver: Bool {
        return false
    }
    
    private func row(at x: Board.VerticalPosition) -> some View {
        HStack {
            self.buttonForTile(at: x, .leading)
            self.buttonForTile(at: x, .center)
            self.buttonForTile(at: x, .trailing)
        }
    }
    
    private func buttonForTile(
        at x: Board.VerticalPosition,
        _ y: Board.HorizontalPosition) -> some View {
        Button(action: { self.handle(.tapTile(x, y)) }) {
            TileView(tile: board[x, y])
        }
        .tileButtonStyle()
    }
}

#if DEBUG
struct BoardView_Previews: PreviewProvider {
    static let emptyBoard = Board()
    static let midGameBoard = Board {
        row {
            Tile.empty
            Tile.used(.one)
            Tile.empty
        }
        row {
            Tile.used(.one)
            Tile.used(.two)
            Tile.used(.two)
        }
        row {
            Tile.empty
            Tile.empty
            Tile.used(.one)
        }
    }
    
    static var previews: some View {
        Group {
            BoardView(board: emptyBoard) { _ in }
            
            BoardView(board: midGameBoard) { _ in }
        }.padding()
        .previewLayout(.fixed(width: 300, height: 300))
    }
}
#endif
