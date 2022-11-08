//
//  WeatherModel.swift
//  Weather (iOS)
//
//  Created by Rajkumar Yadav on 30/12/21.
//

import Foundation

struct WeatherModel:Codable{
    var lat: Double?
    var lon: Double?
    var timezone: String?
    var current:Current?
    var hourly:[Hourly]?
}


struct Current:Codable{
    var clouds:Int?
    var dew_point:Double?
    var dt:Int?
    var feels_like:Double?
    var humidity:Int?
    var pressure:Int?
    var sunrise:Int?
    var temp:Double?
    var uvi:Double?
    var visibility:Int?
    var wind_deg:Int?
    var wind_speed:Int?
    var weather:[weather]?
   
    
    
    func getIndexZeroWeather() -> weather?{
        
        return weather?[0]
        
    }
}




struct Hourly:Codable{
    var dt:Int?
    var temp:Double?
    var weather:[weather]?
}


struct weather:Codable{
    var description:String?
    var icon:String?
    var id:Int?
    var main:String?
}











