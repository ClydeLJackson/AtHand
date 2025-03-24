//
//  ContentView.swift
//  Project Journal
//
//  Created by Clyde Jackson on 3/17/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    var body: some View {
            HStack{
                Sidebar()
                    Divider()
                JournalView()
                
            }
            .preferredColorScheme(.dark)
        }
}

#Preview {
    ContentView()
}
