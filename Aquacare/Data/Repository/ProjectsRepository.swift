//
//  ProjectsRepository.swift
//  Aquacare
//
//  Created by Naufal Fawwaz Andriawan on 24/08/23.
//

import Foundation
import CoreData

class ProjectsRepository: ProjectsRepositoryProtocol {
    
    private let container: NSPersistentContainer
    static let shared = ProjectsRepository()

    init() {
        container = NSPersistentContainer(name: "AquacareDatabase")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Failed to load container: \(error.localizedDescription)")
            }
        }
    }
    
    func getProjects() throws -> [Projects] {
        let request = Projects.fetchRequest()
        return try container.viewContext.fetch(request)
            .map { project in
                project
            }
    }
}
