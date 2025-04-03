//
//  RightSideView.swift
//  Project Journal
//
//  Created by Clyde Jackson on 3/27/25.
//

import SwiftUI
import SwiftData
import Observation

struct RightSideView: View {
    var selectedCategory: SelectedCategory
    @Environment(\.modelContext) private var context

    @Query var categories: [Category]
    
    //If overall active show all
    var body: some View {
        HStack(){
            if selectedCategory.activeOverview{
                ForEach (categories) { category in
                    // let completedTasks = category.tasks.filter{ $0.isCompleted }.count
                    ProgressionView(category: category)
                }
            }else if selectedCategory.category != nil {
                ProgressionView(category: selectedCategory.category!)
            }
        }
        .frame(minWidth: 300)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
   // RightSideView()
}
