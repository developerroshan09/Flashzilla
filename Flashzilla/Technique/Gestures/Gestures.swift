//
//  Gestures.swift
//  Flashzilla
//
//  Created by Roshan Bade on 13/06/2024.
//

import SwiftUI

struct Gestures: View {
    
    @State private var count = 0
    
    @State private var currentPinchAmount = 0.0
    @State private var finalPinchAmount = 1.0
    
    @State private var currentRotateAmount = Angle.zero
    @State private var finalRotateAmount = Angle.zero
    
    var body: some View {
        Text("hello \(count) times!")
            .onTapGesture(count: 2) {
                count += 1
            }
//            .onLongPressGesture {
//                count += 5
//            }
            .onLongPressGesture(minimumDuration: 5) {
                count += 10
            }
        
        Text("Second Closure call!")
            .onLongPressGesture(minimumDuration: 1) {
                print("Long pressed!")
            } onPressingChanged: { inProgress in
                print("In progress: \(inProgress)")
            }
        
        Spacer()
        
        Text("Pinch Gesture")
            .scaleEffect(finalPinchAmount + currentPinchAmount)
            .gesture(
                MagnifyGesture()
                    .onChanged { value in
                        currentPinchAmount = value.magnification - 1
                    }
                    .onEnded { value in
                        finalPinchAmount += currentPinchAmount
                        currentPinchAmount = 0
                    }
            )
        
        Spacer()
        
        Text("Rotation Gesture")
            .rotationEffect(currentRotateAmount + finalRotateAmount)
            .gesture(
                RotateGesture()
                    .onChanged { value in
                        currentRotateAmount = value.rotation
                    }
                    .onEnded { value in
                        finalRotateAmount += currentRotateAmount
                        currentRotateAmount = .zero
                    }
            )
        
        Spacer()
        
        VStack {
            Text("Clash")
                .onTapGesture {
                    print("Text tapped")
                }
        }
        .simultaneousGesture(
            TapGesture()
                .onEnded {
                    print("VStack tapped")
                }
        )
        
        Spacer()
    }
}

#Preview {
    Gestures()
}
