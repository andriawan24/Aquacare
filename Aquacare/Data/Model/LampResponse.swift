//
//  LampResponse.swift
//  Aquacare
//
//  Created by Naufal Fawwaz Andriawan on 23/08/23.
//

import Foundation

struct LampResponse: Codable {
    let startTime: String?
    let endTime: String?
    let intensity: Int?
    
    enum CodingKeys: String, CodingKey {
        case startTime = "start_time"
        case endTime = "end_time"
        case intensity
    }
}
