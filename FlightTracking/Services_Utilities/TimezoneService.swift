import CoreLocation
import Foundation

struct TimezoneService {
    func getCityName(for coordinate: CLLocationCoordinate2D) async -> String? {
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)

        return await withCheckedContinuation { continuation in
            CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
                guard error == nil else {
                    print("Error in reverse geocoding: \(error!.localizedDescription)")
                    continuation.resume(returning: nil)
                    return
                }

                if let placemark = placemarks?.first, let city = placemark.locality {
                    continuation.resume(returning: city)
                } else {
                    continuation.resume(returning: nil)
                }
            }
        }
    }

    func getTimeZoneName(for coordinate: CLLocationCoordinate2D) async -> String? {
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)

        return await withCheckedContinuation { continuation in
            CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
                guard error == nil else {
                    print("Error in reverse geocoding: \(error!.localizedDescription)")
                    continuation.resume(returning: nil)
                    return
                }

                if let timeZone = placemarks?.first?.timeZone {
                    let timeZoneName = timeZone.identifier
                    continuation.resume(returning: timeZoneName)
                } else {
                    continuation.resume(returning: nil)
                }
            }
        }
    }

    func getTimeZoneOffsetInHours(for coordinate: CLLocationCoordinate2D) async -> Double? {
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)

        return await withCheckedContinuation { continuation in
            CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
                guard error == nil else {
                    print("Error in reverse geocoding: \(error!.localizedDescription)")
                    continuation.resume(returning: nil)
                    return
                }

                if let timeZone = placemarks?.first?.timeZone {
                    let offsetInSeconds = timeZone.secondsFromGMT(for: Date())
                    let offsetInHours = Double(offsetInSeconds) / 3600.0
                    continuation.resume(returning: offsetInHours)
                } else {
                    continuation.resume(returning: nil)
                }
            }
        }
    }

    func getTimeZoneOffsets(departureCoordinate: CLLocationCoordinate2D, arrivalCoordinate: CLLocationCoordinate2D) async -> Double {
        async let departureOffset = getTimeZoneOffsetInHours(for: departureCoordinate)
        async let arrivalOffset = getTimeZoneOffsetInHours(for: arrivalCoordinate)

        return await (departureOffset ?? 0) - (arrivalOffset ?? 0)
    }
}
