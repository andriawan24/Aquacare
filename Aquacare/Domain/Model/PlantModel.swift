//
//  PlantModel.swift
//  Aquacare
//
//  Created by Naufal Fawwaz Andriawan on 25/08/23.
//

import Foundation

struct PlantModel: Identifiable, Equatable {
    let id: Int
    let name: String
    let imageURL: String
    
    static func getPlants() -> [PlantModel] {
        return [
            PlantModel(id: 1, name: "Ceratopteris Thalictroides", imageURL: "ImageCerateropteristhalictoides"),
            PlantModel(id: 2, name: "Cryptocoryne Albida 'Brown'", imageURL: "ImageCryptocoryneAlbidaBrown"),
            PlantModel(id: 3, name: "Bucephalandra 'Kedagang'", imageURL: "ImageBucephalandraKedagang"),
            PlantModel(id: 4, name: "Blyxa japonica", imageURL: "ImageBlyxaJaponica")
        ]
    }
}
