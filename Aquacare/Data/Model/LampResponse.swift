//
//  LampResponse.swift
//  Aquacare
//
//  Created by Naufal Fawwaz Andriawan on 23/08/23.
//

import Foundation

struct LampResponse: Codable {
    let startTime: Int?
    let endTime: Int?
    let intensity: Int?
    let state: Bool?
    let scheduled: Bool?
    
    enum CodingKeys: String, CodingKey {
        case startTime = "start_time"
        case endTime = "end_time"
        case intensity, state, scheduled
    }
}
