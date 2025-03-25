//
//  JournalView.swift
//  Project Journal
//
//  Created by Clyde Jackson on 3/17/25.
//

import SwiftUI

struct JournalView: View {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State var viewing: String = ""
    @State var pageSelected: Bool = false
    @State var num: Int = 1
    var body: some View {
        HStack{
        ScrollView{
            Rectangle()
                .foregroundStyle(.black)
                .opacity(0.25)
                .scaledToFill()
                .cornerRadius(15)
                
            }
            if pageSelected{
                TextEditor(text: $viewing)
                    .font(.callout)
                    .padding()
            }else{
                    Text("CREATE A NEW PAGE")
                        .foregroundStyle(.opacity(0.5))
                        .padding()
                        .font(.largeTitle)
                        .fontWeight(.bold)
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
