//
//  JournalView.swift
//  Project Journal
//
//  Created by Clyde Jackson on 3/17/25.
//

import SwiftUI

struct JournalView: View {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    var colors: [Color] = [.red,.blue,.green,.yellow,.purple]
    @State var coolor: Color = .red
    @State var viewing: String = ""
    @State var pageSelected: Bool = false
    @State var num: Int = 1
    var body: some View {
        ScrollView{
            if pageSelected{
                TextEditor(text: $viewing)
                    .font(.callout)
                    .padding()
            }else{
                    Text("CREATE A NEW PAGE \(num)")
                        .foregroundStyle(.opacity(0.5))
                        .padding()
                        .background(coolor)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .animation(reduceMotion ? nil : .bouncy)
            }
            Button("Change"){
                coolor = colors.randomElement() ?? .blue
                num += 1
            }
        }
        .frame(minWidth: 300)
        .frame(maxWidth: .infinity)
        //.border(.blue)
    }
}

#Preview {
    JournalView()
}
