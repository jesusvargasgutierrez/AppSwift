//
//  LabelExampleView.swift
//  ClaseOne
//
//  Created by Arulfo Rodriguez on 09/08/25.
//

import SwiftUI

struct LabelComponentView: View {
    var body: some View {
        Label("Usuario",systemImage: "person.circle")
        
        Label("Icon", image: "CoutryAppIcon")
        
        Label(
            title: {Text("Titulo")},
            icon: { Image("CoutryAppIcon").resizable()
                .scaledToFit()
                .frame(height: 50)}
        )

    }
}

#Preview {
    LabelComponentView()
}
