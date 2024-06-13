//
//  HitTexting.swift
//  Flashzilla
//
//  Created by Roshan Bade on 13/06/2024.
//

import SwiftUI

struct HitTesting: View {
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Rectangle tapped!")
                }
            
            Circle()
                .fill(.red)
                .frame(width: 300, height: 300)
                .contentShape(.rect)
                .onTapGesture {
                    print("Circle tapped!")
                }
//                .allowsHitTesting(false)
        }
        
        Spacer()
        
        VStack {
            Text("Hello")
            Spacer().frame(height: 100)
            Text("World")
        }
        .contentShape(.rect)
        .onTapGesture {
            print("VStack tapped!")
        }
        
        Spacer()
    }
}

#Preview {
    HitTesting()
}
