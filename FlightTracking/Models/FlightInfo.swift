import Foundation
import CoreLocation

struct FlightInfo {
  let departure: AirportAnnotation
  let destination: AirportAnnotation
}

extension FlightInfo {
  var midpointCoord: CLLocationCoordinate2D {
    LocationUtilities.midpoint(between: departure.coordinate, and: destination.coordinate)
  }

  var pointsForFlight: [AirportAnnotation] {
    [departure, destination]
  }
}

extension FlightInfo {
  static func getMockedFlights() -> FlightInfo {
    if let firstRandomItem = AirportAnnotation.MockLocations.randomElement() {
      var filteredArray = AirportAnnotation.MockLocations.filter { $0 != firstRandomItem }
      if let secondRandomItem = filteredArray.randomElement() {
        return FlightInfo(departure: firstRandomItem, destination: secondRandomItem)
      }
    }
    return FlightInfo(departure: AirportAnnotation.MockLocations[0], destination: AirportAnnotation.MockLocations[1])
  }
}
