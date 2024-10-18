//
//  CharactersListView.swift
//  EpamTest
//
//  Created by Carlos Cardoso on 17/10/24.
//

import SwiftUI

struct CharactersListView: View {
    @ObservedObject private var viewModel = HomeViewModel()
    @State private var currentCharacter: Character?
    
    var body: some View {
        Group {
            if let currentCharacter {
                VStack {
                    Text(currentCharacter.name)
                        .font(.title)
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                    
                    AsyncImage(url: .init(string: currentCharacter.image)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    .padding(.bottom)
                    
                    Text(currentCharacter.description)
                        .multilineTextAlignment(.center)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        .lineLimit(4)
                        .padding()
                }
            } else {
                EmptyDataView()
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(.top)
        .background(Color.orange.opacity(0.9))
        .onAppear {
            Task {
                await viewModel.fetchCharacters()
                self.currentCharacter = viewModel.getCharacter()
            }
        }
    }
    
    @ViewBuilder
    private func EmptyDataView() -> some View {
        VStack(spacing: 65) {
            Image(.notFound)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text("Empty data to show. Try again")
                .font(.title3)
                .fontWeight(.semibold)
                .fontDesign(.rounded)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

#Preview {
    CharactersListView()
}
