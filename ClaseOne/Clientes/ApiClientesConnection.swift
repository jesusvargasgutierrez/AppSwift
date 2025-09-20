//
//  ApiClientConnection.swift
//  ClaseOne
//
//  Created by Arulfo Rodriguez on 20/09/25.
//

import Foundation

class ApiClientesConnection {
    
    
    func getAllClientes(page: Int, limit: Int) async throws -> [ClientesModel] {
        
        guard let clientesURL = URL(string:"http://localhost:3000/api/v1/clientes?page=\(page)&limit=\(limit)"
                                    
        )else {
            throw ServiceAPIError.invalidURL
        }
        
        var request = URLRequest(url:clientesURL)
        
        request.httpMethod = "GET"
        request.timeoutInterval = 15
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse {
            guard (200..<300).contains(httpResponse.statusCode) else {
                throw ServiceAPIError.requestFailed(statusCode: httpResponse.statusCode)
            }
        }
        
        guard !data.isEmpty else {
            throw ServiceAPIError.noData
        }
        
        
        do{
            
            let clientes = try JSONDecoder().decode([ClientesModel].self, from: data)
            
            return clientes
            
        }catch{
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
