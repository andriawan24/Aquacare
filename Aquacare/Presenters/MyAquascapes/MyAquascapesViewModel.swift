//
//  MyAquascapesViewModel.swift
//  Aquacare
//
//  Created by Naufal Fawwaz Andriawan on 25/08/23.
//

import Foundation

class MyAquascapesViewModel: ObservableObject {
    
    private let getProjectsUseCase = GetProjectsUseCase()
    @Published private(set) public var projects: [Projects] = []
    
    init() {
        self.initData()
    }
    
    func initData() {
        let result = getProjectsUseCase.execute()
        switch result {
        case .success(let projects):
            print("Projects: \(projects.map({ $0.name }) )")
            self.projects = projects
        case .failure(let failure):
            print("Error \(failure.localizedDescription)")
        }
    }
}
