import CoreLocation
import SwiftUI
import WeatherKit

@Observable
final class WeatherDataService {
    private var weather: Weather?
    private let weatherService = WeatherService.shared

    var weatherSymbol: String {
        if let weather {
            return weather.currentWeather.symbolName
        }

        return "questionmark.diamond.fill"
    }

    var currentCondition: String {
        if let weather {
            let preferredUnit = UserInfo.getUserPreferredTemperatureUnit()
            let temperature = Int(weather.currentWeather.temperature.converted(to: preferredUnit).value.rounded())

            let condition = weather.currentWeather.condition.description
            return "\(temperature)° and \(condition)"
        }

        return ""
    }

    func fetchWeather(for coordinate: CLLocationCoordinate2D) {
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)

        Task {
            do {
                let weather = try await weatherService.weather(for: location)
                DispatchQueue.main.async {
                    self.weather = weather
                }
            } catch {
                print("Error Fetching weather: \(error)")
            }
        }
    }
}

enum UserInfo {
    static func getUserPreferredTemperatureUnit() -> UnitTemperature {
        let locale = Locale.current
        let formatter = MeasurementFormatter()
        formatter.locale = locale

        let temperature = Measurement(value: 25, unit: UnitTemperature.celsius)
        let temperatureString = formatter.string(from: temperature)

        // Check the unit symbol in the formatted string
        if temperatureString.contains("C") {
            return .celsius
        } else if temperatureString.contains("F") {
            return .fahrenheit
        } else if temperatureString.contains("K") {
            return .kelvin
        } else {
            // Default to Celsius if unit cannot be determined
            return .celsius
        }
    }
}
