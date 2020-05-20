import SwiftUI

struct TileView: View {
    let tile: Tile
    
    var body: some View {
        Group {
            if tile == .empty {
                EmptyView()
            } else {
                Image(systemName: tile.imageName)
                    .font(.largeTitle)
                    .foregroundColor(tile.color)
            }
        }
    }
}

private extension Tile {
    var imageName: String {
        switch self {
        case .empty: return ""
        case .used(let player): return player.imageName
        }
    }
    
    var color: Color {
        switch self {
        case .empty: return .clear
        case .used(let player): return player.color
        }
    }
}

private extension Player {
    var imageName: String {
        switch self {
        case .one: return "circle"
        case .two: return "xmark"
        }
    }
    
    var color: Color {
        switch self {
        case .one: return .red
        case .two: return .blue
        }
    }
}

#if DEBUG
struct TileView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TileView(tile: .empty)
            
            TileView(tile: .used(.one))
            
            TileView(tile: .used(.two))
        }.previewLayout(.fixed(width: 80, height: 80))
    }
}
#endif
