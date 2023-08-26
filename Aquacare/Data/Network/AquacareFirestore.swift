//
//  AquacareFirestore.swift
//  Aquacare
//
//  Created by Naufal Fawwaz Andriawan on 23/08/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class AquascapeFirestore {
    
    private let db = Firestore.firestore()
    static let shared: AquascapeFirestore = AquascapeFirestore()
    
    func getLampData() -> AnyPublisher<LampResponse?, Error> {
        let subject = CurrentValueSubject<LampResponse?, Error>(nil)
        
        let listener = db.collection("lamps")
            .document("/device01")
            .addSnapshotListener { documentSnapshot, error in
                if let error = error {
                    subject.send(completion: .failure(error))
                    return
                }
                
                guard let document = documentSnapshot else {
                    subject.send(completion: .failure(error!))
                    return
                }
                
                guard let data = try? document.data(as: LampResponse.self, decoder: Firestore.Decoder()) else {
                    subject.send(nil)
                    return
                }
                
                subject.send(data)
            }
        
        return subject.handleEvents(
            receiveCancel: {
                listener.remove()
            }
        ).eraseToAnyPublisher()
    }
    
    func updateLamp(startTime: Int, endTime: Int, intensity: Int, state: Bool, scheduled: Bool) {
        db.collection("lamps")
            .document("/device01")
            .updateData([
                "start_time": startTime,
                "end_time": endTime,
                "intensity": intensity,
                "state": state,
                "scheduled": scheduled
            ])
    }
}
