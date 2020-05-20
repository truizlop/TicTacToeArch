import BowArch

typealias GameComponent = StoreComponent<Any, GameState, GameInput, GameView>

let gameComponent = GameComponent(
    initialState: .playing(Board(), turn: .one),
    dispatcher: gameDispatcher,
    render: GameView.init)
