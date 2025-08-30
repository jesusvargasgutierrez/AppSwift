//
//  MenuView.swift
//  ClaseOne
//
//  Created by Arulfo Rodriguez on 23/08/25.
//

import SwiftUI


struct ComponentItem: Identifiable {
    let id = UUID()
    let title: String
    let destination: AnyView
}


struct MenuView: View {
    
    
    let components:[ComponentItem] = [
        
        ComponentItem(title: "Button Component",
                      destination: AnyView(ButtonComponentView())),
        
        
        ComponentItem(title: "List Component",
                      destination: AnyView(ListComponentView())),
        
        
        ComponentItem(title: "Label Component",
                      destination: AnyView(LabelComponentView())),
    ]
    
    
    var body: some View {
        NavigationStack{
            List{
                
                Section(header: Text("Aplicaciones")){
                    
                    
                    NavigationLink(destination:CalcPropinasView()) {
                        Text("Calc. Propinas")
                    }
                    
                    NavigationLink(destination:CountrySearchView()) {
                        Text("Explorar Paises")
                    }
                }
                
                Section(header: Text("Componentes")){
                    
                    
                    ForEach(components){ item in
                        //Otra sintaxis para NavigationLink
                        NavigationLink {
                            item.destination
                        } label: {
                            Text(item.title)
                        }
                        
                    }
                    
                    
                }
                
                
            }
        }
    }
}

#Preview {
    MenuView()
}
