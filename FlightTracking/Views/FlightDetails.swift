import SwiftUI

struct FlightDetails: View {
  @EnvironmentObject var uiModel: UIModel
  @State private var previousScrollOffset: CGFloat = 0
  @State private var closeOpacity: Double = 0
  
  @Binding var sheetPresented: Bool

  let flightInfo: FlightInfo
  let minimumOffset: CGFloat = 5

  var body: some View {
    ScrollView(showsIndicators: false) {
      LazyVStack(spacing: 10, pinnedViews: [.sectionHeaders]) {
        Section {
          ActionsRow()
          GateDepartureBanner()
          DepartureAndArrivalDetail()
          SeatDetails()
          InfoSection(flightInfo: flightInfo)
          ArrivalForecast()

        } header: {
          flightDetailsHeader
        }
      }
      .background(
        GeometryReader { proxy in
          Color.clear.preference(key: ViewOffsetKey.self, value: -proxy.frame(in: .named("container")).origin.y)
        })
      .onPreferenceChange(ViewOffsetKey.self) { currentOffset in
        let offsetDifference: CGFloat = self.previousScrollOffset - currentOffset
        if (abs(offsetDifference) > minimumOffset) {
          self.previousScrollOffset = currentOffset
        }
      }
    }
    .scrollIndicators(.hidden)
    .coordinateSpace(name: "container")
  }

  fileprivate var flightDetailsHeader: some View {
    ZStack {
      HStack(spacing: 30) {
        Image(systemName: "airplane.departure")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .background(.white)
          .frame(width: 40)
        VStack(alignment: .leading) {
          HStack {
            Text("DL 666 • Mon, 23")
              .foregroundStyle(.secondary)
              .font(.caption)
              .fontWeight(.medium)
              .textCase(.uppercase)
              .frame(maxWidth: .infinity, alignment: .leading)
          }
          Text("Denver to New Orleans")
            .font(.title2)
            .fontWeight(.semibold)
            .fontDesign(.rounded)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.top, 5)
      }
      Button {
        uiModel.selectedDetent = .height(200)
      } label: {
        Image(systemName: "xmark.circle.fill")
          .font(.title)
          .opacity(0.5)
          .frame(maxWidth: .infinity, alignment: .trailing)
          .offset(x: 5, y: -15)
          .opacity(closeOpacity)
      }
      .buttonStyle(.plain)
    }
    .padding(.horizontal, 20)
    .padding(.top, 17)
    .padding(.bottom, 10)
    .background(Rectangle().fill(.background))
    .overlay(
      Rectangle()
        .frame(width: nil, height: 0.5, alignment: .top)
        .foregroundStyle(.lightGrey.opacity((previousScrollOffset - minimumOffset) / Double(10))), alignment: .bottom
    )
    .onChange(of: uiModel.selectedDetent) {
      withAnimation(.easeOut(duration: 0.2)) {
        closeOpacity = uiModel.selectedDetent == .height(200) ? 0 : 1
      }
    }
  }
}

#Preview {
  FlightDetails(
    sheetPresented: .constant(true),
    flightInfo: FlightInfo(departure: .den, destination: .msy)
  )
    .environmentObject(UIModel())
}
