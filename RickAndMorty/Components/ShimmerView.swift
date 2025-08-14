//
//  ShimmerView.swift
//  RickAndMorty
//
//  Created by Bengi Anıl on 14.08.2025.
//

import SwiftUI
import ShimmerEffect

struct ShimmerView: View {
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: width, height: height)
            .shimmer(true)
    }
}

#Preview {
    ShimmerView(width: 100, height: 20)
}
