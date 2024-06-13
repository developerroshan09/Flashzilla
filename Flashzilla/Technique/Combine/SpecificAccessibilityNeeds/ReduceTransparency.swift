//
//  ReduceTransparency.swift
//  Flashzilla
//
//  Created by Roshan Bade on 13/06/2024.
//

import SwiftUI

struct ReduceTransparency: View {
    
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .padding()
            .background(reduceTransparency ? .black : .black.opacity(0.5))
            .foregroundStyle(.white)
            .clipShape(.capsule)
    }
}

#Preview {
    ReduceTransparency()
}
