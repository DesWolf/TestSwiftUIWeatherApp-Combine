//
//  ForecastViewModel.swift
//  testSwiftUI2
//
//  Created by Max Okuneev on 19.10.2022.
//

import UIKit

struct ForecastViewModel {
    let forecastDaily: Daily
    var tempSystem: Int

    var day: String {
        "\(forecastDaily.dt)".convertToDate(from: .ss_Z, to: .noTimeFull) ?? ""
    }

    var overview: String {
        forecastDaily.weather[0].description.capitalized
    }

    var high: String {
        return "H: \(Double.numberFormatter.string(for: convert(forecastDaily.temp.max)) ?? "0")°"
    }

    var low: String {
        return "L: \(Double.numberFormatter.string(for: convert(forecastDaily.temp.min)) ?? "0")°"
    }

    var pop: String {
        return "💧 \(Double.numberFormatter2.string(for: forecastDaily.pop) ?? "0%")"
    }

    var clouds: String {
        return "☁️ \(forecastDaily.clouds)%"
    }

    var humidity: String {
        return "Humidity: \(forecastDaily.humidity)%"
    }

    var weatherIconURL: URL {
        let urlString = "https://openweathermap.org/img/wn/\(forecastDaily.weather[0].icon)@2x.png"
        return URL(string: urlString)!
    }

    func convert(_ temp: Double) -> Double {
        let celsius = temp - 273.5
        if tempSystem == 0 {
            return celsius
        } else {
            return celsius * 9 / 5 + 32
        }
    }

}
