//
//  GestionClientesView.swift
//  ClaseOne
//
//  Created by Arulfo Rodriguez on 20/09/25.
//

import SwiftUI

struct GestionClientesView: View {
    
    
    @State var clientes: [ClientesModel]=[]
    
    @State private var isLoading = false
    private let apiConnection = ApiClientesConnection()
    @State private var showingNuevoClienteForm = false
    
    var body: some View {
        
        NavigationStack{
            VStack{
                
                
                if isLoading {
                    ProgressView("Cargando clientes")
                } else {
                    clienteListView
                }
                
                
                
            }.navigationTitle("Clientes")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button("Agregar"){
                            showingNuevoClienteForm = true
                        }
                    }
                }
                .sheet(isPresented: $showingNuevoClienteForm){
                    NuevoClienteView()
                }
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundApp)
            .task {
                await loadClientes()
            }
    }
    
    
    private func loadClientes() async {
        isLoading = true
        
        do{
            
            let clientesFromApi = try await apiConnection.getAllClientes(page: 1, limit: 10)
            
            
            clientes = clientesFromApi
            
        }catch{
            print("Error al cargar clientes:\(error.localizedDescription)" )
        }
        isLoading = false
    }
    
    var clienteListView: some View {
        List{
            
            ForEach(clientes){ cliente in
                Text("\(cliente.apellido) \(cliente.nombre)")
            }
            
        }
    }
    
}

#Preview {
    GestionClientesView()
}
