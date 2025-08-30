//
//  CountrySearchView.swift
//  ClaseOne
//
//  Created by Arulfo Rodriguez on 30/08/25.
//

import SwiftUI

struct CountrySearchView: View {
    
    @State var searchRegion: String = ""
    @State var countries: [ApiConnection.Country]? = nil
    
    var body: some View {
        VStack{
            
            TextField("", text: $searchRegion,
                      prompt: Text("Buscar por continente")
                .font(.title2)
                .bold()
                .foregroundColor(.backgroundApp)
            )
            .font(.title2)
            .bold()
            .foregroundColor(.backgorundCompontSelected)
            .padding(16)
            .autocorrectionDisabled()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemGray6))
            )
            .padding(.horizontal)
            .onSubmit {
                
                Task{
                    do{
                        countries = try await ApiConnection().getCountriesByRegion(regionName: searchRegion)
                    }catch{
                        print("Error en consulta \(error)")
                    }
                }
                
                
                
                
            }
            
            if let countries = countries {
                
                List(countries, id:\.name.common ){ country in
                    
                    Text(country.name.common)
                    
                }}
            
            
            Spacer()
            
            
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity )
            .background(.backgroundApp)
    }
}

#Preview {
    CountrySearchView()
}
