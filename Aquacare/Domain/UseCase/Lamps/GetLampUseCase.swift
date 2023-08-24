//
//  GetLampUseCase.swift
//  Aquacare
//
//  Created by Naufal Fawwaz Andriawan on 23/08/23.
//

import Foundation
import Combine

class GetLampUseCase {
    
    private let repository = LampRepository.shared
    
    func execute() -> AnyPublisher<LampModel, Error> {
        return repository.getLampStatus()
            .map { response in
                LampModel(
                    startTime: response?.startTime ?? "",
                    endTime: response?.endTime ?? "",
                    intensity: response?.intensity ?? 0
                )
            }
            .eraseToAnyPublisher()
    }
}
