//
//  CircleImage.swift
//  PokedexSwiftUI
//
//  Created by Ilias Logothetis on 3/3/24.
//

import SwiftUI

struct CircleImage: View {
    
    let icon: String
    let radius: CGFloat
    let color: UIColor
    var squareSide: CGFloat {
        2.0.squareRoot() * radius
    }
    
    @Binding var rotateImage: Bool
    
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color(color))
                .frame(width: radius * 2, height: radius * 2)
            
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .clipShape(Circle())
                .foregroundColor(.white)
                .shadow(color: .white, radius: 1, x: 0, y: 0)
                .rotationEffect(.degrees(rotateImage ? 180 : 0))
        }
    }
}

#Preview {
    CircleImage(icon: "flame", radius: 30, color: .systemPurple, rotateImage:  PokemonViewModel.$defaultFalse)
}
