//
//  TextComponetView.swift
//  ClaseOne
//
//  Created by Arulfo Rodriguez on 09/08/25.
//

import SwiftUI

struct TextComponetView: View {
    var body: some View {
        
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).font(.title)
            Text("Custom").font(.system(
                size: 40,
                weight: .light ,
                design: .monospaced
            ))
            .bold()
            .underline()
            .background(.red)
            
            Text("Lunes Lunes Lunes Lunes Lunes Lunes Lunes ").frame(width: 50)
                .lineLimit(3)
                .lineSpacing(120)
            
            
        }
    }
}

#Preview {
    TextComponetView()
}
