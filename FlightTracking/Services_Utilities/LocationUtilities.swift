import Foundation
import CoreLocation

struct LocationUtilities {
  static func midpoint(between coordinate1: CLLocationCoordinate2D, and coordinate2: CLLocationCoordinate2D) -> CLLocationCoordinate2D {
    let lat1 = coordinate1.latitude.degreesToRadians
    let lon1 = coordinate1.longitude.degreesToRadians
    let lat2 = coordinate2.latitude.degreesToRadians
    let lon2 = coordinate2.longitude.degreesToRadians

    let dLon = lon2 - lon1

    let Bx = cos(lat2) * cos(dLon)
    let By = cos(lat2) * sin(dLon)

    let midLat = atan2(sin(lat1) + sin(lat2), sqrt((cos(lat1) + Bx) * (cos(lat1) + Bx) + By * By))
    let midLon = lon1 + atan2(By, cos(lat1) + Bx)

    return CLLocationCoordinate2D(latitude: midLat.radiansToDegrees, longitude: midLon.radiansToDegrees)
  }

  static func localizedDistanceBetween(_ coordinate1: CLLocationCoordinate2D, and coordinate2: CLLocationCoordinate2D) -> String {
    let location1 = CLLocation(latitude: coordinate1.latitude, longitude: coordinate1.longitude)
    let location2 = CLLocation(latitude: coordinate2.latitude, longitude: coordinate2.longitude)

    let distanceInMeters = location1.distance(from: location2)

    // Create a Measurement object
    let distanceMeasurement = Measurement(value: distanceInMeters, unit: UnitLength.meters)

    // Create a MeasurementFormatter
    let formatter = MeasurementFormatter()
    formatter.unitOptions = .naturalScale
    formatter.unitStyle = .long
    formatter.numberFormatter.maximumFractionDigits = 0

    // Convert to user's preferred unit
    let formattedDistance = formatter.string(from: distanceMeasurement)

    return formattedDistance
  }
}
