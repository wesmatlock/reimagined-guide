import SwiftUI

struct GateDepartureBanner: View {
    var body: some View {
        HStack {
            Text("Gate Departure in 1h 34m")
                .fontWeight(.semibold)
                .foregroundStyle(.green)
                .frame(maxWidth: .infinity, alignment: .leading)
            Label("D-12", systemImage: "figure.walk.circle.fill")
                .fontWeight(.semibold)
                .foregroundStyle(.black)
                .padding(5)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.yellow)
                )
        }
        .padding([.vertical, .horizontal], 15)
        .background(
            Rectangle()
                .fill(.green.opacity(0.05))
        )
        .overlay(
            Rectangle()
                .frame(width: nil, height: 0.25, alignment: .top)
                .foregroundStyle(.green.opacity(0.5)),
            alignment: .top
        )
        .overlay(
            Rectangle()
                .frame(width: nil, height: 0.5, alignment: .top)
                .foregroundStyle(.green.opacity(0.5)),
            alignment: .bottom
        )
    }
}

#Preview {
    GateDepartureBanner()
}
