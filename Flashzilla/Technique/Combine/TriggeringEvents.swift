//
//  TriggeringEvents.swift
//  Flashzilla
//
//  Created by Roshan Bade on 13/06/2024.
//

import SwiftUI

struct TriggeringEvents: View {
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var counter = 0
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onReceive(timer) { time in
                if counter == 5 {
                    timer.upstream.connect().cancel()
                } else {
                    print(("The time is now \(time)"))
                }
                
                counter += 1
            }
    }
}

#Preview {
    TriggeringEvents()
}
