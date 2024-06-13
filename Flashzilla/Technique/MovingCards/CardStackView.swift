//
//  CardStackView.swift
//  Flashzilla
//
//  Created by Roshan Bade on 13/06/2024.
//

import SwiftUI

struct CardStackView: View {
    
    @State private var cards = Array<Card>(repeating: .example, count: 10)
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack {
                ForEach(0..<cards.count, id: \.self) { index in
                    CardView(card: cards[index]) {
                        withAnimation {
                            removeCard(at: index)
                        }
                    }
                    .stacked(at: index, in: cards.count)
                }
            }
        }
    }
    
    func removeCard(at index: Int) {
        cards.remove(at: index)
    }
}

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(y: offset * 10)
    }
}

#Preview {
    CardStackView()
}
