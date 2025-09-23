//
//  CountryListModel.swift
//  ClaseOne
//
//  Created by Arulfo Rodriguez on 13/09/25.
//

import Foundation

struct CountryListModel: Codable, Identifiable {
    
    var id: UUID? = UUID()
    
    let name: String
    let cca2: String
    let flag: String
    
}
