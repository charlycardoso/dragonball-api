//
//  CharacterItem.swift
//  EpamTest
//
//  Created by Carlos Cardoso on 17/10/24.
//

import SwiftUI

struct CharacterItem: View {
    var body: some View {
        VStack {
            Image(.vegetaNormal)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60)
            
            Text("Prince Vegeta")
                .font(.headline)
                .fontWeight(.bold)
                .fontDesign(.rounded)
                .padding(.bottom, 4)
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
        }
        .clipped()
        .shadow(radius: 3, y: 3)
    }
}

#Preview {
    CharacterItem()
}
