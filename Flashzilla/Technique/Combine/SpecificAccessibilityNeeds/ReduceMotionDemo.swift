//
//  ReduceMotionDemo.swift
//  Flashzilla
//
//  Created by Roshan Bade on 13/06/2024.
//

import SwiftUI

struct ReduceMotionDemo: View {
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @State private var scale = 1.0
    
    var body: some View {
        Button("Hello, World!") {
            withOptionalAnimation {
                scale *= 1.5
            }
        }
        .scaleEffect(scale)
    }
    
    func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
        if UIAccessibility.isReduceMotionEnabled {
            return try body()
        } else {
            return try withAnimation(animation, body)
        }
    }
}

#Preview {
    ReduceMotionDemo()
}
