//
//  StateChangesNotification.swift
//  Flashzilla
//
//  Created by Roshan Bade on 13/06/2024.
//

import SwiftUI

struct StateChangesNotification: View {
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onChange(of: scenePhase) { oldPhase, newPhase in
                if newPhase == .active {
                    print("Active")
                } else if newPhase == .inactive {
                    print("Inactive")
                } else if newPhase == .background {
                    print("Background")
                }
            }
    }
}

#Preview {
    StateChangesNotification()
}
