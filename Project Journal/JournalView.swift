//
//  JournalView.swift
//  Project Journal
//
//  Created by Clyde Jackson on 3/17/25.
//

import SwiftUI
import SwiftData
import Observation

struct JournalView: View {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @Environment(\.modelContext) private var context
    
    @Query private var categories: [Category]
    var selectedCategory: SelectedCategory
    
    
    //Get selected category
    @State private var loadChanges: Int = 0
    @State var overview: Bool = false
    @State var viewing: String = ""
    @State var pageSelected: Bool = false
    @State var num: Int = 1
    var body: some View {
        HStack{
            ScrollView{
                VStack{
                    TextField("Add Task",text: $viewing)
                        .onKeyPress(keys: [.return]){ press in
                            if viewing.isEmpty {return .ignored}
                            let category = selectedCategory.category
                            category?.tasks.append(Task(name: viewing))
                            
                            viewing = ""
                            return.handled
                        }
                    ForEach (selectedCategory.category?.tasks ?? [Task]()){ task in
                        ProgView(task: task)
                    }
                    
                    //    .padding()
                }
                .frame(minWidth: 200)
                .frame(width: 280)
                .border(.green)
            }
            
           // .opacity(0.25)
            .frame(minWidth: 300)
            .frame(maxWidth: .infinity)
            .background(Color.bg,  in: RoundedRectangle(cornerRadius: 15))
            .cornerRadius(15)
            //.border(.red)
            //.border(.blue)
        }
    }
}

#Preview {
   // JournalView()
}
