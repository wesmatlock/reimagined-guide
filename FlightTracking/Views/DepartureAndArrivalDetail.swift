import SwiftUI

struct DepartureAndArrivalDetail: View {

  @State private var departurePosition: CGFloat = 0
  @State private var arrivalPosition: CGFloat = 0
  @State private var sectionHeight: CGFloat = 0

  var body: some View {
    HStack(alignment: .top) {

      ZStack {
        Image(systemName: "arrow.up.right.circle.fill")
          .foregroundStyle(.background, .green)
          .background(
            Circle()
              .fill(.background)
          )
          .offset(y: departurePosition - 10)

        Image(systemName: "arrow.down.right.circle.fill")
          .foregroundStyle(.background, .green)
          .background(
            Circle()
              .fill(.background)
          )
          .offset(y: arrivalPosition - 10)
      }
      .fontWeight(.bold)
      .background(
        Rectangle()
          .frame(width: 0.5, alignment: .center)
          .frame(height: max(arrivalPosition - 10 - 10, 0))
          .offset(y: departurePosition)
          .foregroundStyle(.primary.opacity(0.25)),
        alignment: .top
      )

      VStack {
        HStack {
          Text("DEN")
            .font(.title)
            .fontWeight(.bold)
            .overlay(
              Rectangle()
                .fill(.clear)
                .frame(height: 0.5)
                .overlay(
                  GeometryReader { proxy in
                    Color.clear.preference(key: TextCenter.self, value: proxy.frame(in: .named("DepartureAndArrivalDetailsSection")).minY)
                  }
                )
                .onPreferenceChange(TextCenter.self) { offset in
                  departurePosition = offset
                }
            )

          Spacer()

          Text("7:45 PM")
            .font(.title)
            .fontWeight(.semibold)
            .textCase(.uppercase)
            .foregroundStyle(.green)
        }

        Group {
            HStack {
              Text("Denver International")
                .fontWeight(.regular)
              Spacer()
              Text("Scheduled")
                .fontWeight(.bold)
            }

            HStack {
              Text("Terminal C • Gate 35")
                .fontWeight(.bold)
              Spacer()
              Text("in 1h 45m")
                .fontWeight(.regular)

            }
        }
        .font(.caption)
        .foregroundStyle(.secondary)

        ZStack {
          Rectangle()
            .frame(height: 0.5)
            .opacity(0.25)

          Text("Total Flight time: 2h 31m • 1,079 miles")
            .font(.caption)
            .fontWeight(.regular)
            .foregroundStyle(.secondary)
            .padding(.vertical, 10)
            .padding(.horizontal, 3)
            .background(.background)
        }

        VStack {
          HStack {
            Text("MSY")
              .font(.title)
              .fontWeight(.bold)
              .overlay(
                Rectangle()
                  .fill(.clear)
                  .frame(height: 0.5)
                  .overlay (
                    GeometryReader { proxy in
                      Color.clear.preference(key: TextCenter.self, value: proxy.frame(in: .named("DepartureAndArrivalDetailsSection")).minY)
                    }
                  )
                  .onPreferenceChange(TextCenter.self, perform: { value in
                    arrivalPosition = value
                  })
              )
            Spacer()

            Text("10:12 PM")
              .font(.title)
              .fontWeight(.semibold)
              .textCase(.uppercase)
              .foregroundStyle(.green)
          }
          Group {
            HStack {
              Text("New Orleans International")
                .font(.caption.weight(.regular))
              Spacer()
              Text("Scheduled")
                .font(.caption.weight(.bold))
            }

            HStack {
              Text("Terminal 3 • Gate 4B")
                .font(.caption.weight(.bold))
              Spacer()
              Text("in 1h 16m")
                .font(.caption.weight(.regular))
            }

            Text("Baggage Claim: D")
              .font(.caption.weight(.regular))
              .frame(maxWidth: .infinity, alignment: .leading)
          }
          .foregroundStyle(.secondary)
        }
      }
      .padding(.leading, 10)
    }
    .frame(maxWidth: .infinity)
    .overlay(
      GeometryReader { proxy in
        Color.clear.preference(key: SectionHeight.self, value: proxy.frame(in: .named("DepartureAndArrivalDetailsSection")).minY)
      }
    )
    .onPreferenceChange(SectionHeight.self, perform: { value in
      sectionHeight = value
    })
    .coordinateSpace(name: "DepartureAndArrivalDetailsSection")
    .padding(.leading, 10)
    .padding(.trailing)
    .padding(.bottom, 20)


  }
}

#Preview {
  DepartureAndArrivalDetail()
}

struct TextCenter: PreferenceKey {
  typealias Value = CGFloat

  static var defaultValue: CGFloat = .zero

  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
    value = nextValue()
  }
}


struct SectionHeight: PreferenceKey {
  typealias Value = CGFloat

  static var defaultValue: CGFloat = .zero

  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
    value = nextValue()
  }
}
