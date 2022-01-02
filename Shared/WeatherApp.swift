//
//  WeatherApp.swift
//  Shared
//
//  Created by Rajkumar Yadav on 27/11/21.
//

import SwiftUI

@main
struct WeatherApp: App {
    
    let homeVM = HomeVM()
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(homeVM)
        }
    }
}
