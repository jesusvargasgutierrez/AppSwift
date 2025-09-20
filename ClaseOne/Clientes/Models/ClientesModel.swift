//
//  ClientesModel.swift
//  ClaseOne
//
//  Created by Arulfo Rodriguez on 20/09/25.
//

import Foundation

struct ClientesModel: Codable, Identifiable {
    
    var id: Int
    let nombre: String
    let apellido: String
    let email: String
    let telefono: String
    
}
