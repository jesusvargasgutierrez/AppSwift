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
    
    @State private var selecction: String?
    
    
    var groupedContries: [String: [ApiConnection.Country]]
    {
        guard let countries = countries else { return[:] }
        return Dictionary(grouping: countries){
            String($0.name.common.prefix(1)).uppercased()
        }
        
    }
    
    var sortedKeys: [String] {
        groupedContries.keys.sorted()
    }
    
    
    
    
    var body: some View {
        
        NavigationStack{
            VStack{
                searchField
                
                if (countries != nil){
                    countriesList
                }
                
                Spacer()
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity )
                .background(.backgroundApp)
        }
        
    }
    
    var countriesList: some View {
        List{
            ForEach(sortedKeys, id: \.self){ key in
                countrySection(for: key)
            }
        }
    }
    
    @ViewBuilder //Mas de una vista
    func countrySection(for key: String)-> some View {
        
        if let countriesForKey = groupedContries[key] {
            Section(header: sectionHeader(key)){
                ForEach(countriesForKey.sorted(                            by:{$0.name.common < $1.name.common}),
                        id: \.name.common) { country in
                    countryRow(country)
                }
            }
        }
        
    }
    
    //La misma vista
    func sectionHeader(_ key: String) -> some View{
        Text(key)
            .font(.headline)
            .foregroundColor(.white)
            .padding(.horizontal, 12)
            .padding(.vertical, 4)
            .background(Color.blue)
            .clipShape(Capsule())
            .padding(.leading, 8)
    }
    
    
    
    @ViewBuilder
    func countryRow(_ country:ApiConnection.Country) -> some View {
        NavigationLink(destination: CountryDetailsView(countryCode: country.cca2)) {
            HStack{
                
                
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
                        Image(systemName: "flag.slash.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.gray)
                        
                    @unknown default:
                        EmptyView()
                        
                    }
                    
                    
                }
                
                Text(country.name.common)
            }
        }
    }
    
    
    
    
    
    var searchField: some View {
        
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
        
    }
    
}

#Preview {
    CountrySearchView()
}
