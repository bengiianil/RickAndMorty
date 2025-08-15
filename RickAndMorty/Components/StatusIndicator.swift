//
//  File.swift
//  RickAndMorty
//
//  Created by Bengi Anıl on 15.08.2025.
//

import SwiftUI

// MARK: - Status Indicator Component
struct StatusIndicator: View {
    let status: String
    
    var color: Color {
        switch status.lowercased() {
        case "alive":
            return .green
        case "dead":
            return .red
        default:
            return .gray
        }
    }
    
    var body: some View {
        Circle()
            .fill(color)
            .frame(width: 8, height: 8)
    }
}
