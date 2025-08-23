//
//  MenuView.swift
//  ClaseOne
//
//  Created by Arulfo Rodriguez on 23/08/25.
//

import SwiftUI

struct MenuView: View {
    
    var body: some View {
        NavigationStack{
            VStack{
                
                NavigationLink(destination:CalcPropinasView()) {
                    Text("Calc. Propinas")
                }

                //Otra sintaxis para NavigationLink
                NavigationLink {

                } label: {
                    Text("App 2")
                }
                

                
                Text("App 3")
                Text("App 4")
                Text("App 5")
                
            }
        }
    }
}

#Preview {
    MenuView()
}
