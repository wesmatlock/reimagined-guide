import SwiftUI

struct ArrivalForecast: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 7) {
            VStack(alignment: .leading) {
                Text("Arrival Flight Forecast")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("UA 666 performance over the last 60 days.")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 5)

            HStack {
                VStack {
                    Text("Late")
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                        .foregroundStyle(.secondary)
                    HStack(spacing: 3.5) {
                        Image(systemName: "clock")
                            .fontWeight(.semibold)
                        Text("27%")
                            .font(.system(size: 15))
                    }
                }

                Spacer()

                VStack(alignment: .leading, spacing: 4) {
                    Text("Observed")
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                        .foregroundStyle(.secondary)

                    HStack(spacing: 3.5) {
                        Image(systemName: "airplane.circle")
                            .fontWeight(.semibold)
                        Text("12")
                            .font(.system(size: 15))
                    }
                }
            }
            .padding(.top, 7)
            .padding(.horizontal, 5)

            Grid(alignment: .leading) {
                ForEach(ArrivalData.generateMockData()) { item in
                    GridRow {
                        Text("\(item.name)")
                        GeometryReader { proxy in
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 5, style: .continuous)
                                    .fill(.tertiary.opacity(0.4))

                                RoundedRectangle(cornerRadius: 5, style: .continuous)
                                    .fill(item.statusColor)
                                    .frame(width: proxy.size.width * item.value)
                            }
                        }

                        Text("\(item.value.formatted(.percent.precision(.fractionLength(0))))")
                            .gridColumnAlignment(.trailing)
                    }
                }
            }
            .font(.footnote)
            .padding(.top, 20)
        }
        .padding([.vertical, .horizontal], 15)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(.border, lineWidth: 1)
        )
        .padding(.horizontal, 15)
    }
}

#Preview {
    ArrivalForecast()
}
