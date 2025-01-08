import MapKit
import SwiftUI

@Observable
final class MainFlightViewModel {
    var flights: FlightInfo = .getMockedFlights()
    var mapCamera: MapCameraPosition = .camera(MapCamera(centerCoordinate: CLLocationCoordinate2D(latitude: 33.925129700072, longitude: -98.48033042085098), distance: 8_000_000))

    func updateCameraPosition() {
        let distance = LocationUtilities.distanceBetween(flights.departure.coordinate, and: flights.destination.coordinate)
        let adjustedDistance = max(distance * 5.5, 1000)

        mapCamera = .camera(
            MapCamera(centerCoordinate: flights.midpointCoord, distance: adjustedDistance))
    }

    func resetFlights() {
        flights = FlightInfo.getMockedFlights()
    }
}
