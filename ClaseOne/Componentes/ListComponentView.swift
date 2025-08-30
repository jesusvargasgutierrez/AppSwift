//
//  ListComponentView.swift
//  ClaseOne
//
//  Created by Arulfo Rodriguez on 30/08/25.
//

import SwiftUI


var alumnos = [
    
    Alumno(name:"Sofía"),
    Alumno(name:"Luis"),
    Alumno(name:"María"),
    Alumno(name:"Arnulfo"),
    
]

var apellidos = [
    Apellido(lastname:"Rodríguez"),
    Apellido(lastname:"Rodríguez"),
    Apellido(lastname:"Siqueiros"),
    Apellido(lastname:"Orozco"),
    Apellido(lastname:"Rivera"),
    
]

struct Alumno {
    let name: String
}

struct Apellido: Identifiable {
    var id = UUID()
    let lastname: String
}


struct ListComponentView: View {
    var body: some View {
        
        /**
         Estructura basica
         */
        //  List{
        //      Text("Lista")
        //      Text("Lista")
        //      Text("Lista")
        //  }

        /**
         Estructura definiendo un ID del objeto
         */
        //List{
        //    ForEach(alumnos, id:\.name){ alumno in
        //        Text(alumno.name)
        //    }
        // }
        
        
        /**
         Estructura agregando un ID por medio de  Identifiable en el objeto
         */
        // List {
        //    ForEach(apellidos){apellido in
        //        Text(apellido.lastname)
        //    }
        // }
        
        List{
            Section(header: Text("Nombres")){
                   ForEach(alumnos, id:\.name){ alumno in
                        Text(alumno.name)
                   }
            }
            Section(header: Text("Apellidos")){
                ForEach(apellidos){apellido in
                      Text(apellido.lastname)
                   }
            }
        }.listStyle(.automatic)
        
        
        
    }
}

#Preview {
    ListComponentView()
}
