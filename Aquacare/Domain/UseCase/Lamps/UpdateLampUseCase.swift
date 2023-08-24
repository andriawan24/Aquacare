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
        repository.updateLamp(startTime: param.startTime, endTime: param.endTime, intensity: param.intensity)
    }
    
    struct Param {
        let startTime: String
        let endTime: String
        let intensity: Int
    }
}
