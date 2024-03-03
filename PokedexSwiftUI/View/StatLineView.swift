//
//  StatLineView.swift
//  PokedexSwiftUI
//
//  Created by Ilias Logothetis on 16/1/22.
//

import SwiftUI

struct StatLineView: View {
    let title: String
    let color: Color
    let number: Int
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.gray)
                .padding(.trailing)
                .frame(width: 80, alignment: .center)
            Text(String(number))
//                .padding(.trailing)
                .frame(width: 50, alignment: .center)
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 35)
                    .frame(height: 17)
                    .foregroundColor(Color(UIColor.systemGray5))
                RoundedRectangle(cornerRadius: 35)
                    .frame(width: number > 200 ? 200 : CGFloat(number), height: 17)
                .foregroundColor(color)
            }
            .frame(width: 200)
        }
    }
}

struct StatLineView_Previews: PreviewProvider {
    static var previews: some View {
        StatLineView(title: "Defense", color: .yellow, number: 7777)
    }
}
