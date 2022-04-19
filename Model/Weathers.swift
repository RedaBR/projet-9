//
//  MeteoModel.swift
//  Baluchon
//
//  Created by Reda on 15/02/2022.
//

 

import Foundation

// MARK: - Rate
class WheaterData: Decodable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int

   
}

// MARK: - Clouds
class Clouds: Decodable {
    let all: Int

   
}

// MARK: - Coord
class Coord: Decodable {
    let lon: Double
    let lat: Double

   
}

// MARK: - Main
class Main: Decodable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int

   
}

// MARK: - Sys
class Sys: Decodable {
    let type: Int
    let id: Int
    let country: String
    let sunrise: Int
    let sunset: Int

   
}

// MARK: - Weather
class Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String

  
}

// MARK: - Wind
class Wind: Decodable {
    let speed: Double
    let deg: Int

  
}

