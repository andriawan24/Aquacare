//
//  UpdateLampUseCase.swift
//  Aquacare
//
//  Created by Naufal Fawwaz Andriawan on 24/08/23.
//

import Foundation

class UpdateLampUseCase {
    
    private let repository = LampRepository.shared
    
    func execute(param: Param) {
        repository.updateLamp(startTime: param.startTime, endTime: param.endTime, intensity: param.intensity, state: param.state, scheduled: param.scheduled)
    }
    
    struct Param {
        let startTime: Int
        let endTime: Int
        let intensity: Int
        let state: Bool
        let scheduled: Bool
    }
}
