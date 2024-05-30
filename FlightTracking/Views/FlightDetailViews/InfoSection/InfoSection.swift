import SwiftUI
import CoreLocation

struct InfoSection: View {

  let flightInfo: FlightInfo

  @State var viewModel = InfoSectionViewModel()

  var body: some View {
    VStack(alignment: .leading, spacing: 7)  {
      VStack(alignment: .leading) {
        Text(Constants.title)
          .font(.title2)
          .fontWeight(.semibold)
        Text(Constants.subTitle)
          .font(.callout)
          .fontWeight(.semibold)
          .foregroundStyle(.secondary)
          .frame(maxWidth: .infinity, alignment: .leading)
      }
      .padding(.horizontal, 5)

      HStack(spacing: 5) {
        Image(systemName: "clock")
          .font(.title2)
          .padding(.leading, 5)
          .padding(.trailing, 15)

        VStack(alignment: .leading) {
          Text(viewModel.timezoneChange)
            .font(.subheadline)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
          Text(viewModel.timezoneCityInfo)
            .font(.caption)
            .foregroundStyle(.secondary)
        }
        .padding(.vertical, 20)
        .overlay(
          Rectangle()
            .frame(width: nil, height: 0.5, alignment: .top)
            .foregroundStyle(.border)
          , alignment: .bottom)
      }

      HStack(spacing: 5) {
        Image(systemName: viewModel.weatherSymbol)
          .font(.title2)
          .padding(.leading, 5)
          .padding(.trailing, 15)
        VStack(alignment: .leading, spacing: 7) {
          Text("Arrival Weather")
            .font(.subheadline)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
          Text("Current Condition: \(viewModel.weatherCondition)")
            .font(.caption)
            .foregroundStyle(.secondary)
        }
        .padding(.vertical, 10)
      }
    }
    .padding([.vertical, .horizontal], 15)
    .overlay (
      RoundedRectangle(cornerRadius: 20, style: .continuous)
        .stroke(.border, lineWidth: 1)
    )
    .padding(.horizontal, 15)
    .padding(.vertical, 10)
    .onAppear {
      viewModel.updateInfo(for: flightInfo)
    }
  }

  private enum Constants {
    static let title = "Good To Know!"
    static let subTitle = "Information about this flight."

  }
}

#Preview {
  InfoSection(flightInfo: FlightInfo.getMockedFlights())
}
