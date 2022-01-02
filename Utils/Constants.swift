//
//  Constants.swift
//  Weather (iOS)
//
//  Created by Rajkumar Yadav on 30/12/21.
//

import Foundation

struct API {
    static let Weather_Api_Key = "175a0a17686685f7b0acc7d851c51260"
    static let Url_Base_Weather = "https://api.openweathermap.org/data/2.5/onecall?"
}








func print(_ prams: Any) {
    #if DEBUG
       Swift.print(prams)
    #endif
}
