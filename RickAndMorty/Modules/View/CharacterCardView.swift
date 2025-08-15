//
//  CharacterCardView.swift
//  RickAndMorty
//
//  Created by Bengi Anıl on 14.08.2025.
//

import SwiftUI
import Kingfisher

struct CharacterCardView: View {
    let character: CharacterDetailModel?
    let onTap: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            userImageView
            userStatusView
            userNameView
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white)
                .stroke(Color.gray.opacity(0.1), lineWidth: 2)
        )
        .onTapGesture {
            onTap()
        }
    }
}

extension CharacterCardView {
    
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
            HStack {
                StatusIndicator(status: status)
                Text(status)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("•")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text(character?.species ?? "Unknown")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
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
    CharacterCardView(character: PreviewProvider.shared.character.first, onTap: {})
}
