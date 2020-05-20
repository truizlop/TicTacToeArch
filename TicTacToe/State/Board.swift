struct Board {
    enum VerticalPosition: Int {
        case top = 0
        case middle = 1
        case bottom = 2
    }
    
    enum HorizontalPosition: Int {
        case leading = 0
        case center = 1
        case trailing = 2
    }
    
    private let grid: [[Tile]]
    
    init() {
        self.grid = Array(
            repeating: Array(repeating: .empty, count: 3),
            count: 3)
    }
    
    init(@BoardBuilder builder: () -> [[Tile]]) {
        self.grid = builder()
    }
    
    fileprivate init(grid: [[Tile]]) {
        self.grid = grid
    }
    
    subscript(_ x: VerticalPosition, _ y: HorizontalPosition) -> Tile {
        self.grid[x.rawValue][y.rawValue]
    }
    
    func set(value: Tile, at x: VerticalPosition, _ y: HorizontalPosition) -> Board {
        var newGrid = self.grid
        newGrid[x.rawValue][y.rawValue] = value
        return Board(grid: newGrid)
    }
    
    func checkWinner() -> Player? {
        if checkWinningPositions(for: .one) {
            return .one
        } else if checkWinningPositions(for: .two) {
            return .two
        } else {
            return nil
        }
    }
    
    var hasEmptySpaces: Bool {
        grid.map { row in row.contains(.empty) }.combineAll()
    }
    
    private func checkWinningPositions(for player: Player) -> Bool {
        let winningPositions: [[(VerticalPosition, HorizontalPosition)]] = [
            [(.top, .leading), (.top, .center), (.top, .trailing)],
            [(.middle, .leading), (.middle, .center), (.middle, .trailing)],
            [(.bottom, .leading), (.bottom, .center), (.bottom, .trailing)],
            
            [(.top, .leading), (.middle, .leading), (.bottom, .leading)],
            [(.top, .center), (.middle, .center), (.bottom, .center)],
            [(.top, .trailing), (.middle, .trailing), (.bottom, .trailing)],
            
            [(.top, .leading), (.middle, .center), (.bottom, .trailing)],
            [(.top, .trailing), (.middle, .center), (.bottom, .leading)]
        ]
        
        return winningPositions.map { positions in
            positions.map { coordinates in
                self[coordinates.0, coordinates.1]
            }.allSatisfy { tile in tile == .used(player) }
        }.first { $0 == true } ?? false
    }
}

@_functionBuilder
struct RowBuilder {
    static func buildBlock(
        _ leading: Tile,
        _ center: Tile,
        _ trailing: Tile) -> [Tile] {
        [leading, center, trailing]
    }
}

func row(@RowBuilder f: () -> [Tile]) -> [Tile] {
    f()
}

@_functionBuilder
struct BoardBuilder {
    static func buildBlock(
        _ top: [Tile],
        _ middle: [Tile],
        _ bottom: [Tile]) -> [[Tile]] {
        [top, middle, bottom]
    }
}

