//
//  CountryDetailsView.swift
//  ClaseOne
//
//  Created by Arulfo Rodriguez on 06/09/25.
//

import SwiftUI

struct CountryDetailsView: View {
    
    var countryCode: String
    
    @State private var country: CountryDetailModel? = nil
    @State private var isLoading = true
    @State private var errorMessage: String? = nil
    
    
    
    var body: some View {
        
        VStack {
            if isLoading {
                ProgressView("Cargando informacion")
                    .font(.title3)
            } else if let country = country {
                List{
                    AsyncImage(url: URL(string: country.flags.png)) { phase in
                        switch phase {
                        case .success (let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height:30)
                                .cornerRadius(4)
                        case .empty:
                            ProgressView()
                                .frame(width: 50, height: 50)
                        case .failure(_):
                            Label(title:{Text(country.name.common)
                                    .font(.title)
                                    .foregroundColor(.red)
                                    .bold()},
                                  icon: { Image(systemName: "flag.slash.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                .foregroundColor(.gray)}
                            )
                        @unknown default:
                            EmptyView()
                            
                        }
                    }
                    Text("Region: \(country.region)")
                        .font(.title)
                        .foregroundColor(.black)
                        .bold()
                    if let currency = country.currencies?.first?.value {
                        Text("Moneda: \(currency.name)")
                            .font(.title)
                            .foregroundColor(.black)
                            .bold()
                    }
                    if let currency = country.currencies?.first?.value {
                        Text("Simbolo: \(currency.symbol ?? "")")
                            .font(.title)
                            .foregroundColor(.black)
                            .bold()
                    }
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
