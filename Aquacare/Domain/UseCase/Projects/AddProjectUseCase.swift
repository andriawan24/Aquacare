//
//  AddProjectUseCase.swift
//  Aquacare
//
//  Created by Naufal Fawwaz Andriawan on 25/08/23.
//

import Foundation

class AddProjectUseCase {
    
    private let repository = ProjectsRepository.shared
    
    func execute(param: Param) -> Result<Projects, Error> {
        let project = repository.saveProject(name: param.name, age: param.age, size: param.size, totalFish: param.totalFish, ph: param.ph, kh: param.kh, gh: param.gh, nitrit: param.nitrit, nitrat: param.nitrat)
        return .success(project)
    }
    
    struct Param {
        let name: String, age: Int, size: String, totalFish: String, ph: Int, kh: Int, gh: Int, nitrit: Int, nitrat: Int
    }
}
