import SwiftUI

enum FlightStatus: CaseIterable {
    case early
    case onTime
    case fifteenMinLate
    case thirtyMinLate
    case fortyFiveMinLate
    case cancelled
    case diverted
}

extension FlightStatus {
    var description: String {
        switch self {
        case .early:
            return "Early"
        case .onTime:
            return "On Time"
        case .fifteenMinLate:
            return "15m Late"
        case .thirtyMinLate:
            return "30M Late"
        case .fortyFiveMinLate:
            return "45m Late"
        case .cancelled:
            return "Canceled"
        case .diverted:
            return "Diverted"
        }
    }
}

extension FlightStatus {
    var color: Color {
        switch self {
        case .early:
            return .green
        case .onTime:
            return .green.opacity(0.75)
        case .fifteenMinLate:
            return .yellow
        case .thirtyMinLate:
            return .orange
        case .fortyFiveMinLate:
            return .orange
        case .cancelled:
            return .red
        case .diverted:
            return .gray
        }
    }
}
