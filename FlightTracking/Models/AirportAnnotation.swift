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
    AirportAnnotation(code: "DEN", name: "Denver International Airport", coordinate: .den),
    AirportAnnotation(code: "MSY", name: "New Orleans", coordinate: .msy),
    AirportAnnotation(code: "ATL", name: "Hartsfield–Jackson Atlanta International Airport", coordinate: .atl),
    AirportAnnotation(code: "DFW", name: "Dallas/Fort Worth International Airport", coordinate: .dfw),
    AirportAnnotation(code: "ORD", name: "O'Hare International Airport", coordinate: .ord),
    AirportAnnotation(code: "LAX", name: "Los Angeles International Airport", coordinate: .lax),
    AirportAnnotation(code: "JFK", name: "John F. Kennedy International Airport", coordinate: .jfk),
    AirportAnnotation(code: "LAS", name: "Harry Reid International Airport", coordinate: .las),
    AirportAnnotation(code: "MCO", name: "Orlando International Airport", coordinate: .mco),
    AirportAnnotation(code: "CLT", name: "Charlotte Douglas International Airport", coordinate: .clt),
    AirportAnnotation(code: "SEA", name: "Seattle–Tacoma International Airport", coordinate: .sea),
    AirportAnnotation(code: "PHX", name: "Phoenix Sky Harbor International Airport", coordinate: .den),
    AirportAnnotation(code: "EWR", name: "Newark Liberty International Airport", coordinate: .ewr),
    AirportAnnotation(code: "SFO", name: "San Francisco International Airport", coordinate: .sfo),
    AirportAnnotation(code: "IAH", name: "George Bush Intercontinental Airport", coordinate: .iah),
    AirportAnnotation(code: "BOS", name: "Logan International Airport", coordinate: .bos),
    AirportAnnotation(code: "FLL", name: "Fort Lauderdale–Hollywood International Airport", coordinate: .fll),
    AirportAnnotation(code: "MIA", name: "Miami International Airport", coordinate: .mia),
    AirportAnnotation(code: "MSP", name: "Minneapolis–Saint Paul International Airport", coordinate: .msp),
    AirportAnnotation(code: "LGA", name: "LaGuardia Airport", coordinate: .lga),
    AirportAnnotation(code: "DCA", name: "Ronald Reagan Washington National Airport", coordinate: .dca),
    AirportAnnotation(code: "SLC", name: "Salt Lake City International Airport", coordinate: .slc),
    AirportAnnotation(code: "SAN", name: "San Diego International Airport", coordinate: .san),
  ]
}
