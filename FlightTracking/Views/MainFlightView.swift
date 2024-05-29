import SwiftUI
import MapKit

struct MainFlightView: View {
  @StateObject var uiModel = UIModel()
  @State private var sheetPresented: Bool = true
  @State private var referenceOpacity: Double = 0
  @State private var camera: MapCameraPosition = .camera(MapCamera(centerCoordinate: CLLocationCoordinate2D(latitude: 33.925129700072, longitude: -98.48033042085098), distance: 8_000_000))

  let flights: FlightInfo = FlightInfo.getMockedFlights()
  var body: some View {
    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
      Map(position: $camera) {
        ForEach(flights.pointsForFlight) { location in
          Annotation("\(location.name)", coordinate: location.coordinate, anchor: .leading) {
            HStack(spacing: 3) {
              Circle()
                .fill(.flightyBlue)
                .stroke(.white, lineWidth: 2)
                .frame(height: 12)

              HStack {
                Text(location.code)
                  .font(.system(size: 10).weight(.semibold))
                  .foregroundStyle(.white)
                  .padding(.leading, 4)
                  .padding(.trailing, 3)
                  .frame(maxHeight: .infinity, alignment: .center)
                  .background(.flightyBlue)

                Text(location.name)
                  .font(.system(size: 12))
                  .foregroundStyle(.white)
                  .padding(.vertical, 3)
                  .padding(.leading, 3)
                  .padding(.trailing, 4)
                  .background(.flightyLightBlue)
              }
              .clipShape(RoundedRectangle(cornerRadius: 5.0))
              .fixedSize()
            }
            .offset(x: -5)
          }

        MapPolyline(coordinates:  flights.pointsForFlight.map { $0.coordinate })
            .stroke(.flightyPathSecondary, lineWidth: 5)
        MapPolyline(coordinates: flights.pointsForFlight.map { $0.coordinate })
            .stroke(.flightyPathPrimary, lineWidth: 5)
        }
      }
      .ignoresSafeArea()

      VStack(spacing: 10) {
        Image(systemName: "map.fill")
        Divider()
          .frame(maxWidth: 30)
        Image(systemName: "cloud.fill")
      }
      .padding(.horizontal, 6)
      .padding(.vertical, 12)
      .background(
        Capsule()
          .fill(.thickMaterial)
      )
      .padding(.top, 70)
      .padding(.trailing, 20)
      .ignoresSafeArea()
      .sheet(isPresented: $sheetPresented) {
        FlightDetails(
          sheetPresented: $sheetPresented,
          flights: flights
        )
          .presentationDetents([.height(200), .medium, .fraction(0.95)], selection: $uiModel.selectedDetent)
          .presentationBackgroundInteraction(
            .enabled(upThrough: .medium)
          )
          .presentationDragIndicator(.hidden)
          .presentationCornerRadius(21)
          .interactiveDismissDisabled()
      }
    }
    .background(
      Rectangle()
        .fill(.red)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    )
    .environmentObject(uiModel)
  }
}

#Preview {
  MainFlightView()
}

// MARK: - ViewOffsetKet
struct ViewOffsetKey: PreferenceKey {
  typealias Value = CGFloat
  static var defaultValue: CGFloat = .zero
  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
    value += nextValue()
  }
}
