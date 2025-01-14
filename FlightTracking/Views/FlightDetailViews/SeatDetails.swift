import SwiftUI

struct SeatDetails: View {
    var body: some View {
        HStack(spacing: 20) {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "ticket.fill")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Button("Upgrade") {}
                        .tint(.blue)
                        .textCase(.uppercase)
                        .font(.caption2)
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.roundedRectangle(radius: 10))
                }
                Text("Booking Code")
                    .fontWeight(.bold)
                Text("Tap to Edit")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(.border, lineWidth: 1)
            }

            VStack(alignment: .leading) {
                Image(systemName: "carseat.right.fill")
                Text("Seat")
                    .fontWeight(.bold)
                    .frame(minWidth: 100, alignment: .leading)
                Text("Tap  to Edit")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(.border, lineWidth: 1)
            }
        }
        .padding(.horizontal, 15)
    }
}

#Preview {
    SeatDetails()
}
