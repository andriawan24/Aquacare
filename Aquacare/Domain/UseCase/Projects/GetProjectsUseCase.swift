//
//  GetProjectsUseCase.swift
//  Aquacare
//
//  Created by Naufal Fawwaz Andriawan on 24/08/23.
//

import Foundation

class GetProjectsUseCase {
    
    private let repository = ProjectsRepository.shared
    
    func execute() -> Result<[Projects], Error> {
        do {
            let projects = try repository.getProjects()
            return .success(projects)
        } catch {
            return .failure(error)
        }
    }
}
