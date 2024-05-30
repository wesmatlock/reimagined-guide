import SwiftUI
import MapKit

@Observable
final class MainFlightViewModel {

  var flights: FlightInfo = FlightInfo.getMockedFlights()

  func resetFlights() {
    flights = FlightInfo.getMockedFlights()
  }
//
//  var mapCamera: MapCamera {
//    MapCamera(
//      centerCoordinate: flights.midpointCoord,
//      distance: LocationUtilities.distanceBetween(flights.departure.coordinate, and: flights.destination.coordinate)
//    )
//  }
//
//  var camera: MapCameraPosition {
//    .camera(mapCamera)
//  }
}
