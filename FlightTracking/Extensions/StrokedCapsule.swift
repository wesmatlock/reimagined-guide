import SwiftUI

struct StrokedCapsule: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 10)
            .padding(.horizontal, 15)
            .foregroundStyle(.primary)
            .background(
                Capsule()
                    .stroke(.tertiary, lineWidth: 1)
            )
    }
}
