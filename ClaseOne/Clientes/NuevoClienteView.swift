//
//  NuevoClienteView.swift
//  ClaseOne
//
//  Created by Arulfo Rodriguez on 20/09/25.
//

import SwiftUI

struct NuevoClienteView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var nombre = ""
    @State private var apellido = ""
    @State private var email = ""
    @State private var telefono = ""
    
    
    var body: some View {
        NavigationView{
            Form{
                Section("Información Personal"){
                    TextField("Nombre", text: $nombre)
                    TextField("Apellido", text: $apellido)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                    TextField("Teléfono", text: $telefono)
                        .keyboardType(.phonePad)
                    
                }
            }
            
        }.navigationTitle("Agregar Cliente")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancelar"){
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    
                    Button("Guardad"){
                        //LOGICA PARA GUARDAR
                        dismiss()
                        
                        
                    }.disabled(nombre.isEmpty||apellido.isEmpty)
                    
                }
            }
    }
}

#Preview {
    NuevoClienteView()
}
