//
//  CityViewModel.swift
//  Weather app
//
//  Created by Nathaniel Whittington on 8/2/21.
//

import SwiftUI

struct WeatherData {
   var temperature: Double
   var precipitation: Double
   var humidity: Int
   var wind: Double
   var pressure: Double
   var visibility: Double
   var feels: Double
}
struct City {
   var name: String
   var weather: WeatherData
}
struct CityViewModel {
   var city: City

   var formatter: MeasurementFormatter {
      let format = MeasurementFormatter()
      format.unitStyle = .short
      format.unitOptions = .providedUnit
      return format
   }
   var name: String {
      return city.name.capitalized
   }
   var temperatureCelsius: String {
      let temperature = Measurement(value: city.weather.temperature, unit: UnitTemperature.celsius)
      return formatter.string(from: temperature)
   }
   var temperatureFahrenheit: String {
      var temperature = Measurement(value: city.weather.temperature, unit: UnitTemperature.celsius)
      temperature.convert(to: UnitTemperature.fahrenheit)
      return formatter.string(from: temperature)
   }
   var feelsCelsius: String {
      let temperature = Measurement(value: city.weather.feels, unit: UnitTemperature.celsius)
      return formatter.string(from: temperature) + " degrees"
   }
   var feelsFahrenheit: String {
      var temperature = Measurement(value: city.weather.feels, unit: UnitTemperature.celsius)
      temperature.convert(to: UnitTemperature.fahrenheit)
      return formatter.string(from: temperature) + " degrees"
   }
   var precipitation: String {
      let precipitation = Measurement(value: city.weather.precipitation, unit: UnitLength.centimeters)
      return formatter.string(from: precipitation)
   }
   var humidity: String {
      return "\(city.weather.humidity) %"
   }
   var wind: String {
      let wind = Measurement(value: city.weather.wind, unit: UnitSpeed.kilometersPerHour)
      return formatter.string(from: wind)
   }
   var pressure: String {
      let pressure = Measurement(value: city.weather.pressure, unit: UnitPressure.millibars)
      return formatter.string(from: pressure)
   }
   var visibility: String {
      let visibility = Measurement(value: city.weather.visibility, unit: UnitLength.kilometers)
      return formatter.string(from: visibility)
   }
}
class AppData: ObservableObject {
   @Published var userData: [CityViewModel]
   @Published var celsius: Bool = true
   @Published var selectedCity: Int = 0

init() {
          userData = [
             CityViewModel(city: City(name: "Toronto", weather: WeatherData(temperature: 21, precipitation: 0.0, humidity: 83, wind: 0.0, pressure: 1.016, visibility: 14.5, feels: 24))),
             CityViewModel(city: City(name: "New York", weather: WeatherData(temperature: 18, precipitation: 3.0, humidity: 95, wind: 12.4, pressure: 1.020, visibility: 8.5, feels: 15))),
             CityViewModel(city: City(name: "Paris", weather: WeatherData(temperature: 24, precipitation: 8.7, humidity: 90, wind: 5.4, pressure: 1.055, visibility: 10.5, feels: 25)))
          ]
       }
    }
