//
//  ContentView.swift
//  ClaseOne
//
//  Created by Arulfo Rodriguez on 09/08/25.
//

import SwiftUI

struct Ejercicio1: View {
    var body: some View {
        
        VStack{
            HStack{
                Rectangle().foregroundColor(.black)
                Rectangle().foregroundColor(.orange)
                Rectangle().foregroundColor(.yellow)
            }.frame(height: 100)
            Rectangle().frame(height: 100)
                .foregroundColor(.orange)
            HStack{
                Rectangle().foregroundColor(.black)
                Rectangle().foregroundColor(.orange)
                Rectangle().foregroundColor(.yellow)
            }.frame(height: 100)
            
        }.background(.cyan)
        
        
        
        .padding()
    }
}


#Preview {
    Ejercicio1()
}

