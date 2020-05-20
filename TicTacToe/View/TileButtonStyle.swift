import SwiftUI

struct TileButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            configuration.label
        }
        .aspectRatio(1, contentMode: .fill)
        .frame(maxWidth: .infinity,
               maxHeight: .infinity)
            .background(
                configuration.isPressed
                    ? Color.gray.opacity(0.3)
                    : Color.gray.opacity(0.15))
            .mask(RoundedRectangle(cornerRadius: 8))
            .contentShape(RoundedRectangle(cornerRadius: 8))
            .shadow(
                color: Color.black.opacity(0.2),
                radius: configuration.isPressed ? 1 : 3,
                x: 1,
                y: 1)
    }
}

extension View {
    func tileButtonStyle() -> some View {
        self.buttonStyle(TileButtonStyle())
    }
}
