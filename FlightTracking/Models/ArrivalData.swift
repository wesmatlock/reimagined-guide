import SwiftUI

struct ArrivalData: Identifiable {
    let id = UUID()
    let name: String
    let value: Double
    let statusColor: Color

    static func generateMockData() -> [ArrivalData] {
        var mockData = [ArrivalData]()

        for status in FlightStatus.allCases {
            mockData.append(
                ArrivalData(
                    name: status.description,
                    value: Double.random(in: 0.0 ... 0.4),
                    statusColor: status.color
                )
            )
        }

        return mockData
    }
}
