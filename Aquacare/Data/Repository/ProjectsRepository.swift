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
    
    func saveProject(name: String, age: Int, size: String, totalFish: String, ph: Int, kh: Int, gh: Int, nitrit: Int, nitrat: Int) -> Projects {
        let project = Projects(context: container.viewContext)
        project.name = name
        project.age = Int16(age)
        project.size = size
        project.added = Date()
        project.levelPH = Int16(ph)
        project.levelKH = Int16(kh)
        project.levelGH = Int16(gh)
        project.levelNitrit = Int16(nitrit)
        project.levelNitrat = Int16(nitrat)
        saveContext()
        return project
    }
    
    func updateProject(id: NSManagedObjectID, name: String, age: Int, size: String, totalFish: String, ph: Int, kh: Int, gh: Int, nitrit: Int, nitrat: Int) -> Projects? {
        
        let project = try? getProject(id)
        if let project = project {
            project.name = name
            project.age = Int16(age)
            project.size = size
            project.added = Date()
            project.levelPH = Int16(ph)
            project.levelKH = Int16(kh)
            project.levelGH = Int16(gh)
            project.levelNitrit = Int16(nitrit)
            project.levelNitrat = Int16(nitrat)
            saveContext()
        }
        return project
    }
    
    func getProject(_ id: NSManagedObjectID) throws -> Projects? {
//        let request = Projects.fetchRequest()
//        request.fetchLimit = 1
//        request.predicate = NSPredicate(
//            format: "id = %@", id.uuidString
//        )
        let context =  container.viewContext
        let project = try? context.existingObject(with: id) as? Projects
        return project
    }
    
    private func saveContext() {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
}
