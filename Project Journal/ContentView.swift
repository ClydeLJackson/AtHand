//
//  ContentView.swift
//  Project Journal
//
//  Created by Clyde Jackson on 3/17/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    var selectedCategory = SelectedCategory()
    //
    @State var loadChanges: Int = 1
    @State var newnum: Int = 1
    @State var currentName:String = ""
    @State var renaming: String = ""
    @Environment(\.modelContext) private var context
    @Query private var projects : [Category]
    //
    var body: some View {
        HStack{
            //Button("Gripper\(newnum)"){
            
            //}
            VStack{
                
                HStack(){
                    Text("Categories")
                        .padding()
                   // Image(systemName: "plus.square")
                    //    .font(.largeTitle)
                }
                
                Divider()
                
                TextField("New Category", text: $currentName)
                    .onKeyPress(keys: [.return]) { press in
                        if currentName.isEmpty {return.ignored}
                        AddCategory(name: currentName)
                        return .handled
                    }
                    //.background(in: .capsule)
                    .textFieldStyle(.roundedBorder)
                Button{
                    selectedCategory.activeOverview = true
                }label:{
                    Text("Overview")
                        .foregroundStyle(!selectedCategory.activeOverview ? .gray : .white)
                        .padding()
                }
                .buttonStyle(.borderless)
                Divider()
                //Project Name List
                ForEach (projects){ project in
                    
                    Button(){
                        selectedCategory.category = project
                        selectedCategory.activeOverview = false
                    }label:{
                            Text(project.name)
                            .foregroundStyle(selectedCategory.category == project && !selectedCategory.activeOverview ? .white : .gray)
                                .frame(maxWidth: .infinity)
                                .padding()
                    }
                    .contextMenu(){
                        Button("Rename"){
                            //project.renaming = true
                        }
                        Button("Delete"){
                            context.delete(project)
                        }
                    }
                    .buttonStyle(.borderless)
                    Divider()
                    //slot(category: project)
                }
                Spacer()
            }
            .frame(width: 175)
           // Sidebar(currentName: currentName)
            //    .environmentObject(selectedCategory)
            Divider()
            JournalView(selectedCategory: selectedCategory)
                .padding()
            RightSideView(selectedCategory: selectedCategory)
            //yooo
        }

            .preferredColorScheme(.dark)
        }
    
    func AddCategory(name: String){
        let project = Category(name: name,task: [])
        //print(project )
        context.insert(project)
        print(context.insertedModelsArray)
        currentName = ""
    }
}

#Preview {
    ContentView()
}
