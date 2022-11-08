//
//  HomeVM.swift
//  Weather (iOS)
//
//  Created by Rajkumar Yadav on 30/12/21.
//

import Foundation
import Combine
import SwiftUI


class HomeVM:ObservableObject{
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published var weatherData: WeatherModel?
    var hourleyList:[HourlyVM]?
    
    //MARK:- setup request of model data
    var weather:weather? { weatherData?.current?.getIndexZeroWeather() }
    var weatherDes:String { weather?.description ?? "" }
    var mainWather:String { weather?.main ?? "" }
    var weatherIcon:String { weather?.icon ?? ""}
    var feelsLike:String {
        let temp = weatherData?.current?.feels_like ?? 0.0
       return "Feels like \(Int(temp - 273.15))°C"
    }
   
    var weTemprature:String {
    let temp =  weatherData?.current?.temp ?? 0.0
    return  "\(Int((temp - 273.15)))°C"
    }
    var wind:String{
        let windSpeed = weatherData?.current?.wind_speed ?? 0
        return "Wind: \(windSpeed)m/s NNW"
    }
    var humidity:String{
        return "Humidity: \(weatherData?.current?.humidity ?? 0)%"
    }
    var UVIndex:String{
        return "UV index:\(weatherData?.current?.uvi ?? 0.0)"
    }
    var pressure:String{
        return "Pressure:\(weatherData?.current?.pressure ?? 0)hPa"
    }
    var visibility:String{
        return "Visibility:\(weatherData?.current?.visibility ?? 0)km"
    }
    var dewPoint:String{
        return "Dew point:\(weatherData?.current?.dew_point ?? 0)"
    }
    
    //MARK:- Request weather data
    
    func getWeatherData(){
        //22.5726° N, 88.3639° E
        let prams = "lat=55.5&lon=37.5&exclude=daily&appid=\(API.Weather_Api_Key)"
        let url = API.Url_Base_Weather + prams
        
        NetworkManager.shared.getData(urlString: url, type:WeatherModel.self).sink { completion in
            
            switch completion {
            case .failure(let error):
                print("Error is \(error)")
            case .finished:
                print("Finished")
            }
            
        } receiveValue: { [weak self] weatherData in
            self?.weatherData = weatherData
            self?.hourleyList = weatherData.hourly?.map({ item in
                return HourlyVM(hourlyItem: item)
            })
           
        }.store(in: &cancellables)


    }
    
}











