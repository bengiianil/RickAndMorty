//
//  CharacterRowView.swift
//  RickAndMorty
//
//  Created by Bengi Anıl on 14.08.2025.
//

import SwiftUI
import Kingfisher

struct CharacterRowView: View {
    let character: CharacterDetailModel?

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            userImageView
            userStatusView
            userNameView
        }
        .padding()
        .background(.white)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray.opacity(0.1), lineWidth: 2)
        )
    }
}

private extension CharacterRowView {
    
    @ViewBuilder
    var userImageView: some View {
        if let image = character?.image,
           let imageUrl = URL(string: image) {
            KFImage(imageUrl)
                .placeholder { ShimmerView(width: 200, height: 200) }
                .resizable()
                .scaledToFit()
                .frame(width: Screen.width / 3)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        } else {
            ShimmerView(width: 200, height: 200)
        }
    }
    
    @ViewBuilder
    var userStatusView: some View {
        if let status = character?.status {
            Text(status)
                .font(.subheadline)
                .foregroundColor(.black)
        } else {
            ShimmerView(width: 100, height: 20)
        }
    }

    @ViewBuilder
    var userNameView: some View {
        if let name = character?.name {
            Text(name)
                .font(.headline)
                .foregroundColor(.black)
        } else {
            ShimmerView(width: 120, height: 20)
        }
    }
}


#Preview {
    CharacterRowView(character: PreviewProvider.shared.character.first)
}
