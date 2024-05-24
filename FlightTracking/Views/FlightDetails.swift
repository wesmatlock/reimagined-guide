import SwiftUI

struct FlightDetails: View {
  @State var uiModel: UIModel = UIModel()
  @State private var previousScrollOffset: CGFloat = 0
  @State private var closeOpacity: Double = 0
  @Binding var sheetPresented: Bool
  let minimumOffset: CGFloat = 5


  var body: some View {
    ScrollView(showsIndicators: false) {
      LazyVStack(spacing: 10, pinnedViews: [.sectionHeaders]) {
        Section {
          ActionsRow()
          GateDepartureBanner()
          DepartureAndArrivalDetail()
          SeatDetails()
          InfoSection()
          ArrivalForecast()

        } header: {
          flightDetailsHeader
        }
      }


    }
  }

  fileprivate var flightDetailsHeader: some View {
    ZStack {

    }
  }
}

#Preview {
  FlightDetails(sheetPresented: .constant(true))
}
