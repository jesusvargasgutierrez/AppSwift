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
        let cca2: String
        
        
        
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
    
    
    func getCountryByCCA(cca2: String) async throws -> CountryDetailModel {
    
        guard let countryURL = URL(string:
                                "https://restcountries.com/v3.1/alpha/\(cca2)?fields=name,capital,currencies,flags,region,cca2"
        ) else {
            throw ServiceAPIError.invalidURL
        }
        
        var request = URLRequest (url: countryURL)
        
        request.httpMethod = "GET"
        request.timeoutInterval = 15
        
             
        let(data, response) = try await URLSession.shared.data(for: request)
        if let jsonString = String(data: data, encoding: .utf8) {
            print("Respuesta JSON: \(jsonString)")
        }
        
        if let httpResponse = response as? HTTPURLResponse {
            guard (200..<300).contains(httpResponse.statusCode) else {
                throw ServiceAPIError.requestFailed(statusCode: httpResponse.statusCode)
            }
        }
        
        guard !data.isEmpty else {
            throw ServiceAPIError.noData
        }
        
        do{
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            
            
            let country = try decoder.decode(CountryDetailModel.self, from: data)
            
            return country
            
        } catch {
            throw ServiceAPIError.decodingFailed
        }
        
    }
    
    func getCountriesList(regionName:String) async throws -> [CountryListModel] {
        
        
        
        guard let countriesURL = URL(string:
                                "http://localhost:3000/api/v1/getAmericaCountriesList"
        ) else {
            throw ServiceAPIError.invalidURL
        }
        
        var request = URLRequest (url: countriesURL)
        
        request.httpMethod = "GET"
        request.timeoutInterval = 15
        
             
        let(data, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse {
            guard (200..<300).contains(httpResponse.statusCode) else {
                throw ServiceAPIError.requestFailed(statusCode: httpResponse.statusCode)
            }
        }
        
        guard !data.isEmpty else {
            throw ServiceAPIError.noData
        }
        
        do{
            
            let countries = try JSONDecoder()
                .decode([CountryListModel].self, from: data)
            
            return countries
            
            
        }catch {
        
            throw ServiceAPIError.decodingFailed
            
        }
        

        
        
    }
    
    
    
    
    func getCountriesByRegion(regionName:String) async throws -> [Country] {
        
        
        
        guard let countriesURL = URL(string:
                                "https://restcountries.com/v3.1/region/\(regionName)?fields=name,capital,currencies,flags,region,cca2"
        ) else {
            throw ServiceAPIError.invalidURL
        }
        
        var request = URLRequest (url: countriesURL)
        
        request.httpMethod = "GET"
        request.timeoutInterval = 15
        
             
        let(data, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse {
            guard (200..<300).contains(httpResponse.statusCode) else {
                throw ServiceAPIError.requestFailed(statusCode: httpResponse.statusCode)
            }
        }
        
        guard !data.isEmpty else {
            throw ServiceAPIError.noData
        }
        
        do{
            
            let countries = try JSONDecoder()
                .decode([Country].self, from: data)
            
            return countries
            
            
        }catch {
        
            throw ServiceAPIError.decodingFailed
            
        }
        

        
        
    }
    
    enum ServiceAPIError: Error, LocalizedError {
        
        case invalidURL
        case requestFailed(statusCode: Int)
        case decodingFailed
        case noData
        
        
        var errorDescription: String? {
            switch self {
                
            case .invalidURL:
                return "La URL es invalida"
                
            case .requestFailed(let statusCode):
                return "La solicitud fallo con el estado HTTP: \(statusCode)"
                
            case .decodingFailed:
                return "No se pudieron decodificar los datos"
                
            case .noData:
                return "No se recibieron datos."
                
            }
        }
        
    }
    
    
    
    
    
    
}
