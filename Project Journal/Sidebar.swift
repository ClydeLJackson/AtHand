//
//  Sidebar.swift
//  Project Journal
//
//  Created by Clyde Jackson on 3/17/25.
//

import SwiftUI
import SwiftData

struct slot: View{
    var category: Category
   
    
    var body: some View{
        Button(){
            
        }label:{
            Text(category.name)
                .frame(maxWidth: .infinity)
                .padding()
        }
        .buttonStyle(.borderless)
        Divider()
    }
}

struct Sidebar: View {
    @State var currentName:String = ""
    var selectedCategory: SelectedCategory
    @Environment(\.modelContext) private var context
    @Query private var projects : [Category]

    var body: some View{
        ScrollView{
            VStack(){
                HStack(){
                    Text("Categories")
                        .padding()
                    Image(systemName: "plus.square")
                        .font(.largeTitle)
                }
                Divider()
                
                TextField("New Project", text: $currentName)
                    .onKeyPress(keys: [.return]) { press in
                        AddCategory(name: currentName)
                        return .handled
                    }
                //Project Name List
                ForEach (projects){ project in
                    
                    Button(){
                        selectedCategory.category = project
                    }label:{
                        Text(project.name)
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                    .buttonStyle(.borderless)
                    Divider()
                    //slot(category: project)
                }
                
                
                
                Spacer()
                
            }
        }
        .frame(width: 175)
        //  .presentationSizing()
    }
    
    func AddCategory(name: String){
        let project = Category(name: name,task: [])
        //print(project )
        context.insert(project)
        print(context.insertedModelsArray)
        currentName = ""
    }
}

//#Preview{
   // Sidebar()
//}
