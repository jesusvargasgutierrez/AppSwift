//
//  ButtonComponentView.swift
//  ClaseOne
//
//  Created by Arulfo Rodriguez on 09/08/25.
//

import SwiftUI

struct ButtonComponentView: View {
    var body: some View {
        
        Button("Click me") {
            print("Clicked!")
        }
        
        Button(
           action: {
                print("Clicked!")
            },
           label:{
               Text("Botón")
                   .bold()
                   .foregroundColor(.white)
                   .frame(width: 80, height: 50)
                   .background(.purple)
                   .cornerRadius(10)
           },
        )
    }
}

struct Counter: View {
    
    @State var contadorTotal = 5
    
    var body: some View {
        
        Button(
           action: {
                
               contadorTotal += 1
               print("Contador: \(contadorTotal)")
               
            },
           label:{
               Text("Contador: \(contadorTotal)")
                   .bold()
                   .foregroundColor(.white)
                   .frame(width: 150, height: 50)
                   .background(.blue)
                   .cornerRadius(10)
           },
        )
        
        
    }
}

#Preview {
    Counter()
}


#Preview {
    ButtonComponentView()
}
