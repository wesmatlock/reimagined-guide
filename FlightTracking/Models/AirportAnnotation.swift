import MapKit

struct AirportAnnotation: Identifiable {
  let id = UUID()
  let code: String
  let name: String
  let coordinate: CLLocationCoordinate2D
}
