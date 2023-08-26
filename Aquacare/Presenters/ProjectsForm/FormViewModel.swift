//
//  FormViewModel.swift
//  Aquacare
//
//  Created by Naufal Fawwaz Andriawan on 25/08/23.
//

import Foundation
import CoreData

class FormViewModel: ObservableObject {
    
    @Published var tankAge: String = ""
    @Published var tankName: String = ""
    @Published var tankSize: TankSize = .small
    @Published var searchPlantText: String = ""
    @Published var chosenPlants: [PlantModel] = []
    @Published var totalFish: String = ""
    @Published var phLevel: String = ""
    @Published var khLevel: String = ""
    @Published var ghLevel: String = ""
    @Published var nitritLevel: String = ""
    @Published var nitratLevel: String = ""
    
    @Published var goToDetail: Bool = false
    @Published var result: Projects? = nil
    var id: NSManagedObjectID? = nil
    
    init(id: NSManagedObjectID? = nil) {
        self.id = id
    }
    
    private let addProjectUseCase = AddProjectUseCase()
    private let repository = ProjectsRepository.shared
    
    func save() {
        let result = addProjectUseCase.execute(param: AddProjectUseCase.Param(name: tankName, age: Int(tankAge) ?? 0, size: tankSize.rawValue, totalFish: totalFish, ph: Int(phLevel) ?? 0, kh: Int(khLevel) ?? 0, gh: Int(ghLevel) ?? 0, nitrit: Int(nitritLevel) ?? 0, nitrat: Int(nitratLevel) ?? 0))
        print("Result is \(result)")
        
        switch result {
        case .success(let project):
            print("Project is \(project)")
            self.result = project
            goToDetail = true
        case .failure(let error):
            print("Error \(error.localizedDescription)")
        }
    }
    
    func updateProject(id change: NSManagedObjectID) {
        let result = repository.updateProject(id: id!, name: tankName, age: Int(tankAge) ?? 0, size: tankSize.rawValue, totalFish: totalFish, ph: Int(phLevel) ?? 0, kh: Int(khLevel) ?? 0, gh: Int(ghLevel) ?? 0, nitrit: Int(nitritLevel) ?? 0, nitrat: Int(nitratLevel) ?? 0)
        
        if let result = result {
            print("Project is \(result)")
            self.result = result
            goToDetail = true
        }
    }
    
    func getProject(id change: NSManagedObjectID) {
        if let project = try? repository.getProject(id!) {
            DispatchQueue.main.async {
                print("Project \(project)")
                self.phLevel = "\(project.levelPH)"
                self.khLevel = "\(project.levelKH)"
                self.ghLevel = "\(project.levelGH)"
                self.nitritLevel = "\(project.levelNitrit)"
                self.nitratLevel = "\(project.levelNitrat)"
                print("PH level \(self.phLevel)")
            }
        }
    }
}

enum TankSize: String {
    case small = "Small", medium = "Medium", large = "Large"
}
