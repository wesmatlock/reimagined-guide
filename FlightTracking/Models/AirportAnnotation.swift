import MapKit

struct AirportAnnotation: Identifiable {
  let id = UUID()
  let code: String
  let name: String
  let city: String
  let coordinate: CLLocationCoordinate2D
}

extension AirportAnnotation: Equatable {
  static func == (lhs: AirportAnnotation, rhs: AirportAnnotation) -> Bool {
    return lhs.id == rhs.id
  }
}

extension AirportAnnotation {
  static var MockLocations: [AirportAnnotation] = [
    AirportAnnotation(code: "DEN", name: "Denver International Airport", city: "Denver", coordinate: .den),
    AirportAnnotation(code: "MSY", name: "New Orleans International Airport", city: "New Orleans", coordinate: .msy),
    AirportAnnotation(code: "ATL", name: "Hartsfield–Jackson Atlanta International Airport", city: "Altanta", coordinate: .atl),
    AirportAnnotation(code: "DFW", name: "Dallas/Fort Worth International Airport", city: "Dallas/Fort Worth", coordinate: .dfw),
    AirportAnnotation(code: "ORD", name: "O'Hare International Airport", city: "Chicago", coordinate: .ord),
    AirportAnnotation(code: "LAX", name: "Los Angeles International Airport", city: "Los Angeles", coordinate: .lax),
    AirportAnnotation(code: "JFK", name: "John F. Kennedy International Airport", city: "New York City", coordinate: .jfk),
    AirportAnnotation(code: "LAS", name: "Harry Reid International Airport", city: "Las Vegas", coordinate: .las),
    AirportAnnotation(code: "MCO", name: "Orlando International Airport", city: "Orland", coordinate: .mco),
    AirportAnnotation(code: "CLT", name: "Charlotte Douglas International Airport", city: "Charlotte", coordinate: .clt),
    AirportAnnotation(code: "SEA", name: "Seattle–Tacoma International Airport", city: "Seattle-Tecoma", coordinate: .sea),
    AirportAnnotation(code: "PHX", name: "Phoenix Sky Harbor International Airport", city: "Phoenix", coordinate: .phx),
    AirportAnnotation(code: "EWR", name: "Newark Liberty International Airport", city: "Newark", coordinate: .ewr),
    AirportAnnotation(code: "SFO", name: "San Francisco International Airport", city: "San Francisco", coordinate: .sfo),
    AirportAnnotation(code: "IAH", name: "George Bush Intercontinental Airport", city: "Houston", coordinate: .iah),
    AirportAnnotation(code: "BOS", name: "Logan International Airport", city: "Boston", coordinate: .bos),
    AirportAnnotation(code: "FLL", name: "Fort Lauderdale–Hollywood International Airport", city: "Fort Lauderdale", coordinate: .fll),
    AirportAnnotation(code: "MIA", name: "Miami International Airport", city: "Miami", coordinate: .mia),
    AirportAnnotation(code: "MSP", name: "Minneapolis–Saint Paul International Airport", city: "Minneapolis", coordinate: .msp),
    AirportAnnotation(code: "LGA", name: "LaGuardia Airport", city: "New York City", coordinate: .lga),
    AirportAnnotation(code: "DCA", name: "Ronald Reagan Washington National Airport", city: "Washington, D.C", coordinate: .dca),
    AirportAnnotation(code: "SLC", name: "Salt Lake City International Airport", city: "Salt Lake City", coordinate: .slc),
    AirportAnnotation(code: "SAN", name: "San Diego International Airport", city: "San Diego", coordinate: .san),
  ]
}
