//
//  LampRepositoryImpl.swift
//  Aquacare
//
//  Created by Naufal Fawwaz Andriawan on 23/08/23.
//

import Foundation
import Combine
import CoreData

class LampRepository: LampRepositoryProtocol {
    
    private let firestore = AquascapeFirestore.shared
    static let shared = LampRepository()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "AquacareDatabase")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Cannot load CoreData: \(error.localizedDescription)")
            }
        }
    }
    
    func getLampStatus() -> AnyPublisher<LampResponse?, Error> {
        return firestore.getLampData()
    }
    
    func updateLamp(startTime: String, endTime: String, intensity: Int) {
        firestore.updateLamp(startTime: startTime, endTime: endTime, intensity: intensity)
    }
}
