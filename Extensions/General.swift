//
//  General.swift
//  Weather (iOS)
//
//  Created by Rajkumar Yadav on 30/12/21.
//

import Foundation

extension Data {
    var prettyJson: String? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
                     let data = try? JSONSerialization.data(withJSONObject: object, options: [.sortedKeys]),
                     let prettyPrintedString = String(data: data, encoding:.ascii) else { return nil }

               return prettyPrintedString
    }
}
