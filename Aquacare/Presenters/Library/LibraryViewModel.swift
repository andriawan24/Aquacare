//
//  LibraryViewModel.swift
//  Aquacare
//
//  Created by Naufal Fawwaz Andriawan on 24/08/23.
//

import Foundation

class LibraryViewModel: ObservableObject {
    
    @Published var searchText: String = ""
    @Published var category: InformationCategory = .plant

    enum InformationCategory {
        case plant, animal, hardscape
    }
}
