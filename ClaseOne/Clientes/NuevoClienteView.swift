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
    @State private var isLoading = false
    private let apiConnection = ApiClientesConnection()
    
    
    var body: some View {
        NavigationView {
            Form {
                Section("Información Personal") {
                    TextField("Nombre", text: $nombre)
                    TextField("Apellido", text: $apellido)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                    TextField("Teléfono", text: $telefono)
                        .keyboardType(.phonePad)
                }
            }
            .navigationTitle("Agregar Cliente")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Guardar") {
                        Task {
                            await handleSend()
                        }
                    }
                }
            }
        }
    }
    
    func handleSend() async {
        isLoading = true
        
        do{
            let clientesFromApi = try await apiConnection.CreateClientes(nombre: nombre,apellido:apellido,email:email,telefono:telefono)
            
        }catch{
            print("Error al cargar clientes:\(error.localizedDescription)" )
        }
        isLoading = false
    }
}

#Preview {
    NuevoClienteView()
}
