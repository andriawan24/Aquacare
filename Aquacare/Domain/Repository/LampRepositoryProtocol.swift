//
//  LampRepository.swift
//  Aquacare
//
//  Created by Naufal Fawwaz Andriawan on 23/08/23.
//

import Foundation
import Combine

protocol LampRepositoryProtocol {
    func getLampStatus() -> AnyPublisher<LampResponse?, Error>
    func updateLamp(startTime: Int, endTime: Int, intensity: Int, state: Bool, scheduled: Bool)
}
