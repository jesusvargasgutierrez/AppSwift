//
//  CountryDetailModel.swift
//  ClaseOne
//
//  Created by Arulfo Rodriguez on 06/09/25.
//

import Foundation


struct CountryDetailModel: Codable, Identifiable {
    
        var id = UUID()
        let flags: Flag
        let name: Name
        let currencies: [String: Currency]?
        let capital: [String]?
        let region: String
        let cca2: String
        
        
        
        struct Flag: Codable {
            let png: String
            let svg: String
            let alt: String
        }
        
        
        
        struct Name: Codable {
            let common: String
            let official: String
            let nativeName: [String: NativeName]?
        }
        
        struct NativeName: Codable {
            let official: String
            let common: String
        }
        
        struct Currency: Codable {
            let name: String
            let symbol: String?
        }
    
    
    
}
