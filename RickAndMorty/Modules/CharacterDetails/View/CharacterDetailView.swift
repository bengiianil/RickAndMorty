//
//  CharacterDetailView.swift
//  RickAndMorty
//
//  Created by Bengi Anıl on 15.08.2025.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: CharacterDetailModel?
    
    var body: some View {
        ScrollView {
            if let episodes = character?.episode {
                ForEach(episodes, id: \.self) { episode in
                    Text(episode)
                }
            }
         
        }
        .navigationTitle(character?.name ?? "Unknown")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CharacterDetailView(character: PreviewProvider.shared.character.first)
}
