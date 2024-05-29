import Foundation
import CoreLocation

@Observable
final class InfoSectionViewModel {
  var flightInfo: FlightInfo?
  var timezoneChange: String = ""
  var timezoneCityInfo: String = ""

  var weatherSymbol: String {
    weatherDataService.weatherSymbol
  }

  var weatherCondition: String {
    weatherDataService.currentCondition
  }

  private var weatherDataService = WeatherDataService()

  func updateInfo(for flightInfo: FlightInfo) {
    self.flightInfo = flightInfo
    weatherDataService.fetchWeather(for: flightInfo.destination.coordinate)
    checkTimezone(for: flightInfo.destination.coordinate)
  }

  func checkTimezone(for destination: CLLocationCoordinate2D) {
    Task {

      if let flightInfo = flightInfo {
        let timezoneOffset = await TimezoneService().getTimeZoneOffsets(
          departureCoordinate: flightInfo.departure.coordinate,
          arrivalCoordinate: flightInfo.destination.coordinate)
        print(timezoneOffset)
        if timezoneOffset != 0 {
          timezoneChange = "Timezone Change"
        } else {
          timezoneChange = "Same Timezone."
        }
        updateTimezoneCityText(for: destination, with: timezoneOffset)
      }
    }
  }

  func updateTimezoneCityText(for destination: CLLocationCoordinate2D, with offset: Double) {
    Task {
      let cityName = await getCity(for: destination)
      if let timezoneName = await TimezoneService().getTimeZoneName(for: destination) {
        print(timezoneName)
        if offset == 0 {
          timezoneCityInfo = "\(cityName) is in your current timezone, no change."
        } else {
          let hourString = abs(offset) == 1 ? "hour" : "hours"
          if offset < 0 {
            timezoneCityInfo = "\(cityName) you will lose \(abs(Int(offset))) \(hourString)."
          } else {
            timezoneCityInfo = "\(cityName) you will gain \(Int(offset)) \(hourString)."
          }
        }
      }
    }
  }

  func getCity(for destination: CLLocationCoordinate2D) async -> String {
    await TimezoneService().getCityName(for: destination) ?? "UNKNOWN"
  }
}
