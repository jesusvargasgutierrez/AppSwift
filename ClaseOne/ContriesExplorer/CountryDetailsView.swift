//
//  CountryDetailsView.swift
//  ClaseOne
//
//  Created by Arulfo Rodriguez on 06/09/25.
//

import SwiftUI

struct CountryDetailsView: View {
    
    var countryCode: String
    
    @State private var country: ApiConnection.Country? = nil
    @State private var isLoading = true
    @State private var errorMessage: String? = nil
    
    
    
    var body: some View {
        
        VStack {
            if isLoading {
                ProgressView("Cargando informacion")
                    .font(.title3)
            } else if let country = country {
                VStack{
                    Text(country.name.common)
                        .font(.largeTitle)
                        .foregroundColor(.red)
                        .bold()
                }
                
            } else if let errorMessage = errorMessage {
                Text("Error \(errorMessage)")
                    .foregroundColor(.red)
                
                
            }
            
            
        }.task {
            await loadCountry()
        }
        
    }
    
    
    func loadCountry() async {
        do{
            
            isLoading = true
            country = try await ApiConnection().getCountryByCCA(cca2: countryCode)

        } catch {
          
            errorMessage = error.localizedDescription
            
        }
        isLoading = false
    }
    
}

#Preview {
    CountryDetailsView(countryCode: "AR")
}
