//
//  LightSettingsViewModel.swift
//  Aquacare
//
//  Created by Naufal Fawwaz Andriawan on 25/08/23.
//

import Foundation
import Combine

class LightViewModel: ObservableObject {
    
    @Published var state: Bool = false
    @Published var intensity: Double = 0
    @Published var startTime: Int = 0
    @Published var endTime: Int = 0
    @Published var scheduled: Bool = false
    
    private let getLampUseCase = GetLampUseCase()
    private let updateLampUseCase = UpdateLampUseCase()
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        getLampUseCase.execute()
            .sink { completion in
                switch completion {
                case .finished:
                    print("Finished")
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            } receiveValue: { model in
                DispatchQueue.main.async {
                    self.state = model.state
                    self.intensity = Double(model.intensity) / 25
                    self.startTime = model.startTime
                    self.endTime = model.endTime
                    self.scheduled = model.scheduled
                }
            }
            .store(in: &cancellable)

    }
    
    func updateLamp(state: Bool, intensity: Double, startTime: Int, endTime: Int, scheduled: Bool) {
        updateLampUseCase.execute(
            param: UpdateLampUseCase.Param(startTime: startTime, endTime: endTime, intensity: Int(intensity) * 25, state: state, scheduled: scheduled)
        )
    }
}
