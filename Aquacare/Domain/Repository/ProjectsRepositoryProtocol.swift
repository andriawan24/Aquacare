//
//  ProjectsRepository.swift
//  Aquacare
//
//  Created by Naufal Fawwaz Andriawan on 24/08/23.
//

import Foundation

protocol ProjectsRepositoryProtocol {
    func getProjects() throws -> [Projects]
}
