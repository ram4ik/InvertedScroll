//
//  ContentView.swift
//  InvertedScroll
//
//  Created by Ramill Ibragimov on 7/3/24.
//

import SwiftUI

struct ContentView: View {
    @State var data = (1...42).map { $0 }
    
    var body: some View {
        VStack {
            List(data, id: \.self) { i in
                Text("\(i)")
                    .flipped()
            }
            .listStyle(.plain)
            .flipped()
        }
    }
}

#Preview {
    ContentView()
}

struct Flipped: ViewModifier {
    func body(content: Content) -> some View {
        content
            .rotationEffect(.radians(Double.pi))
            .scaleEffect(x: -1, y: 1, anchor: .center)
    }
}

extension View {
    func flipped() -> some View {
        modifier(Flipped())
    }
}
