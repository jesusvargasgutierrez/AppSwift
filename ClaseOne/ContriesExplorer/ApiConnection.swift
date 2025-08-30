//
//  ApiConnection.swift
//  ClaseOne
//
//  Created by Arulfo Rodriguez on 30/08/25.
//

import Foundation

class ApiConnection{
    
    
    struct Countries: Codable {
        let response: String
        let result: [Country]
    }

    struct Country: Codable {
        let flags: Flag
        let name: Name
        let currencies: [String: Currency]
        let capital: [String]
        let region: String
        
        
        
        struct Flag: Codable {
            let png: String
            let svg: String
            let alt: String
        }
        
        
        
        struct Name: Codable {
            let common: String
            let official: String
            let nativeName: [String: NativeName]
        }
        
        struct NativeName: Codable {
            let official: String
            let common: String
        }
        
        struct Currency: Codable {
            let name: String
            let symbol: String
        }
    }
    
    func getCountriesByRegion(regionName:String) async throws -> [Country] {
        
        
        let countriesURL = URL(string:
                                "https://restcountries.com/v3.1/region/\(regionName)?fields=name,capital,currencies,flags,region")!
        
        let(data, _) = try await URLSession.shared.data(from: countriesURL)
        
        let countries = try JSONDecoder().decode([Country].self, from: data)
        
        return countries
        
        
    }
    
    
}
