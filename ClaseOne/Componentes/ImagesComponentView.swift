//
//  ImagesView.swift
//  ClaseOne
//
//  Created by Arulfo Rodriguez on 09/08/25.
//

import SwiftUI

struct ImagesComponentView: View {
    var body: some View {
        Image("CoutryAppIcon")
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 50)
        Image(systemName: "person.circle")
            .resizable()
            .frame(width: 90, height: 90)
    }
}

#Preview {
    ImagesComponentView()
}
