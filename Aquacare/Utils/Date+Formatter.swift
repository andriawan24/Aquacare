//
//  Date+Formatter.swift
//  Aquacare
//
//  Created by Naufal Fawwaz Andriawan on 25/08/23.
//

import Foundation
import SwiftUI

extension Date {
    func customFormat(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
