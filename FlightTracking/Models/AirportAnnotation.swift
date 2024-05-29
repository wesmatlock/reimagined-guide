import MapKit

struct AirportAnnotation: Identifiable {
  let id = UUID()
  let code: String
  let name: String
  let coordinate: CLLocationCoordinate2D
}

extension AirportAnnotation: Equatable {
  static func == (lhs: AirportAnnotation, rhs: AirportAnnotation) -> Bool {
    return lhs.id == rhs.id
  }
}

extension AirportAnnotation {
  static var MockLocations: [AirportAnnotation] = [
    AirportAnnotation(code: "DEN", name: "Denver", coordinate: .den),
    AirportAnnotation(code: "MSY", name: "New Orleans", coordinate: .msy),
    AirportAnnotation(code: "ATL", name: "Atlanta", coordinate: .den),
    AirportAnnotation(code: "DFW", name: "Dallas/Fort Worth", coordinate: .dfw),
    AirportAnnotation(code: "ORD", name: "Chicago", coordinate: .ord),
    AirportAnnotation(code: "LAX", name: "Los Angeles", coordinate: .lax),
    AirportAnnotation(code: "JFK", name: "New York City", coordinate: .jfk),
    AirportAnnotation(code: "LAS", name: "Las Vegas", coordinate: .las),
    AirportAnnotation(code: "MCO", name: "Orland", coordinate: .mco),
    AirportAnnotation(code: "CLT", name: "Charlotte", coordinate: .clt),
    AirportAnnotation(code: "SEA", name: "Seattle", coordinate: .phx),
    AirportAnnotation(code: "PHX", name: "Phoenix", coordinate: .den),
    AirportAnnotation(code: "EWR", name: "Newark", coordinate: .ewr),
    AirportAnnotation(code: "SFO", name: "San Francisco", coordinate: .sfo),
    AirportAnnotation(code: "IAH", name: "Houston", coordinate: .iah),
    AirportAnnotation(code: "BOS", name: "Boston", coordinate: .bos),
    AirportAnnotation(code: "FLL", name: "Fort Lauderdale", coordinate: .fll),
    AirportAnnotation(code: "MIA", name: "Miami", coordinate: .mia),
    AirportAnnotation(code: "MSP", name: "Minneapolis and Saint Paul", coordinate: .msp),
    AirportAnnotation(code: "LGA", name: "New York City", coordinate: .lga),
    AirportAnnotation(code: "DCA", name: "Washington, D.C.", coordinate: .dca),
    AirportAnnotation(code: "SLC", name: "Salt Lake City", coordinate: .slc),
    AirportAnnotation(code: "SAN", name: "San Diego", coordinate: .san),
  ]
}
