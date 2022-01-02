//
//  Hourly.swift
//  Weather (iOS)
//
//  Created by Rajkumar Yadav on 02/01/22.
//

import Foundation
import SwiftUI
import Combine

struct HourlyVM:Identifiable {
   
    let hourlyItem:Hourly
    var id = UUID()
    var Time:String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        let date = Date(timeIntervalSince1970: TimeInterval(hourlyItem.dt ?? 0))
        return dateFormatter.string(from: date)
    }
}






