//
//  DropDownView.swift
//  ClaseOne
//
//  Created by Arulfo Rodriguez on 06/09/25.
//

import SwiftUI

struct DropDownView: View {
    
    var hint: String
    var options: [String]
    var anchor: Anchor = .bottom
    var maxWidth: CGFloat = 180
    var cornerRadius: CGFloat = 15
    @Binding var selecction: String?
    
    @State private var expand = false

    var body: some View {
        GeometryReader{
            let size = $0.size
            
            VStack(spacing: 0){
                HStack{
                    Text(selecction ?? hint)
                        .foregroundStyle(selecction == nil ? .gray: .primary)
                        .lineLimit(1)
                    Spacer(minLength: 0)
                    Image(systemName: "chevron.down")
                        .font(.title3)
                        .foregroundStyle(.gray)
                }
                .padding(.horizontal, 16)
                .frame(width: size.width, height: size.height)
                .contentShape(.rect)
                .onTapGesture {
                                withAnimation {
                                    expand.toggle()
                                }
                            }
                
            }
            if expand {
                            VStack(alignment: .leading, spacing: 0) {
                                ForEach(options, id: \.self) { option in
                                    Text(option)
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(Color.white)
                                        .onTapGesture {
                                            selecction = option
                                            withAnimation { expand = false }
                                        }
                                }
                            }
                            .background(RoundedRectangle(cornerRadius: 8).fill(Color.white).shadow(radius: 4))
                        }
            
            
            
        }
    }
    
    
    enum Anchor {
        case top
        case bottom
        
    }
}

#Preview {
    struct PreviewWrapper: View {
        
        @State private var selecction: String? = nil
        
        var body: some View {
            DropDownView(
                hint: "Seleccionar",
                options: ["América", "Europa", "Asia"],
                selecction: $selecction
            )
        }
    }
    
    return PreviewWrapper()
}
