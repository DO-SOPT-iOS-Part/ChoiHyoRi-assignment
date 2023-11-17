//
//  WeatherInfoListData.swift
//  seminar2-assignment
//
//  Created by Hyori Choi on 11/14/23.
//

import Foundation

struct WeatherInfoListData: Equatable {
    let location: String
    let time: String
    let weather: String
    let temperature: Int
    let maxTemperature: Int
    let minTemperature: Int
    
    init(location: String, timezone: Int, weather: String, temperature: Double, maxTemperature: Double, minTemperature: Double) {
        self.location = location
        self.time = convertTime(timezone: timezone)
        self.weather = weather
        self.temperature = convertTemperature(temperature: temperature)
        self.maxTemperature = convertTemperature(temperature: maxTemperature)
        self.minTemperature = convertTemperature(temperature: minTemperature)
    }
}

var weatherInfoListData: [WeatherInfoListData] = []

func convertTemperature(temperature: Double) -> Int {
    return Int(round((temperature - 273.15)))
}

func convertTime(timezone: Int) -> String {
    let timeZone = TimeZone(secondsFromGMT: timezone)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    dateFormatter.timeZone = timeZone
    let currentDate = Date()
    let formattedTime = dateFormatter.string(from: currentDate)
    return formattedTime
}