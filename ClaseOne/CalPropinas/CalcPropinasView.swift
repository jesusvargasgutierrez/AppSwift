//
//  CalcPropinasView.swift
//  ClaseOne
//
//  Created by Arulfo Rodriguez on 23/08/25.
//

import SwiftUI

struct CalcPropinasView: View {
    
    
// Sobrescribir las propiedades de un UINavigationBar
   // init() {
   //     UINavigationBar.appearance().titleTextAttributes =
   //     [.foregroundColor: UIColor.white]
   // }
    
    @State var userType:Int = 1
    @State var propina: Double = 10
    @State var totalCuenta: String = ""
    

    
    
    var body: some View {
        VStack{
            HStack{
                ToggleButton(label: "Individual",
                             imageName: "person.fill",
                             userType: 0,
                             selectedType: $userType)
                ToggleButton(label: "Grupo",
                             imageName: "person.3.fill",
                             userType: 1,
                             selectedType:$userType)
                
                
            }
            VStack{
                TotalDeLaCuentaTextField(totalCuentaAmount: $totalCuenta)
                SelectPropina(selectedPropina: $propina)
                TotalPorPagar()
               
            }
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundApp)
            .toolbar{
                ToolbarItem(placement: .principal){
                    Text("Calculadora Propinas")
                        .bold()
                        .foregroundColor(.white)
                }
            }
    }
}

struct ToggleButton: View {
    let label: String
    let imageName: String
    let userType: Int
    
    @Binding var selectedType:Int

    
    var body: some View {
        
        let color = if(userType == selectedType){
            Color.backgorundCompontSelected
        } else {
            Color.backgroundCompont
        }
        
        
        Button(action: {
            
            selectedType = userType
            
        }){
            VStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .foregroundColor(.white)
                PrimaryLabel(textLabel: label)
                   
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(color)
        }
             
    }
}

struct PrimaryLabel:View {
    let textLabel: String
    var body: some View {
        Text(textLabel)
            .font(.largeTitle)
            .bold()
            .foregroundColor(.white)
    }
}

struct SubLabel:View {
    
    let textLabel: String
    var body: some View {
        Text(textLabel)
            .font(.title2)
            .bold()
            .foregroundColor(.white)
    }
}

struct TotalDeLaCuentaTextField:View {
    
    @Binding var totalCuentaAmount:String
    
    var body: some View {
        
        VStack{
            PrimaryLabel(textLabel: "Total de la cuenta" )
            HStack{
                Image(systemName: "dollarsign.circle.fill")
                    .foregroundColor(.backgroundApp)
                    .font(.system(size: 28))
                    .padding(.horizontal,5)
                    
                TextField("0.00", text: $totalCuentaAmount)
                    .keyboardType(.decimalPad)
                    .padding()
                    .background(.gray.opacity(0.1))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .font(.system(size: 30, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
            }
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundCompont)
        
       
    }
}


struct SelectPropina:View {
    
    @Binding var selectedPropina: Double
    
    var body: some View{
        VStack{
            SubLabel(textLabel: "Propina" )
            PrimaryLabel(textLabel: "\(Int(selectedPropina))%" )
            
            Slider(value: $selectedPropina, in: 0...100, step: 1)
                .accentColor(.backgroundApp)
                .padding(.horizontal, 15)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundCompont)
        
    }
}

struct TotalPorPagar:View {
    var body: some View{
        Text("TOTAL A PAGAR").bold()
            .foregroundColor(.white)
    }
}


#Preview {
    CalcPropinasView()
    //TotalTextField()
}
            
