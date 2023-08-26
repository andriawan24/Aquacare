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
                    startTime: response?.startTime ?? 0,
                    endTime: response?.endTime ?? 0,
                    intensity: response?.intensity ?? 0,
                    state: response?.state ?? false,
                    scheduled: response?.scheduled ?? false
                )
            }
            .eraseToAnyPublisher()
    }
}
