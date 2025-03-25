//
//  Sidebar.swift
//  Project Journal
//
//  Created by Clyde Jackson on 3/17/25.
//

import SwiftUI

struct Sidebar: View {
    @State var currentName:String = ""
    @State var projects : [Project] = []
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
                
                //Project Name List
                ForEach (projects, id: \.self.id){ project in
                        Button(){
                            
                        }label:{
                            Text(project.name)
                                .frame(maxWidth: .infinity)
                            .padding()
                        }
                        .buttonStyle(.borderless)
                    Divider()
                }
                
                TextField("New Project", text: $currentName)
                    .onKeyPress(keys: [.return]) { press in
                        let project = Project(name: "\(currentName)")
                        projects.append(project)
                        
                        currentName = ""
                        
                        return .handled
                    }
                
                Spacer()
                
            }
        }
        .frame(width: 175)
      //  .presentationSizing()
    }
}

#Preview{
    Sidebar()
}
