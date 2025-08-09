//
//  TextFieldComponentView.swift
//  ClaseOne
//
//  Created by Arulfo Rodriguez on 09/08/25.
//

import SwiftUI

struct TextFieldComponentView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {

        VStack {
            TextField("Correo electrónico",text: $email)
                .keyboardType(.emailAddress)
                .padding(16)
                .background(.gray.opacity(0.1))
                .cornerRadius(15)
                .padding(.horizontal, 32)
                .onChange(of: email,{ oldValue, newValue in
                    print("oldValue = \(oldValue,), newValue =  \(newValue)")
                    
                })
            
            SecureField("Contraseña",text: $password)
                .keyboardType(.emailAddress)
                .padding(16)
                .background(.gray.opacity(0.1))
                .cornerRadius(15)
                .padding(.horizontal, 32)
                .onChange(of: password,{ oldValue, newValue in
                    print("oldValuePass = \(oldValue,), newValuePass =  \(newValue)")
                    
                })
        }
                    
        
        
    }
}

#Preview {
    TextFieldComponentView()
}
