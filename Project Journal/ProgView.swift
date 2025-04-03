//
//  ProgView.swift
//  Project Journal
//
//  Created by Clyde Jackson on 3/26/25.
//

import SwiftUI

struct ProgView: View {
    @State var task: Task
    var body: some View {
        ZStack{
            Text(task.name)
                .font(.largeTitle)
                .foregroundStyle(.white)
            HStack{
                Image(systemName: "circle")
                    .foregroundStyle(.white)
                Text(task.name)
                    .padding(5)
                    .background(.gray, in: RoundedRectangle(cornerRadius: 15))
                    .cornerRadius(15)
                
                Spacer().frame(width: 300)
                
                
                
            }
            
           // .border(.red)
        }
        
        .frame(minHeight: 60)
        .frame(maxWidth: 200, maxHeight: 60)
        
        .background(.bg, in: RoundedRectangle(cornerRadius: 5))
       // .cornerRadius(15)
        
        //.opacity(0.25)

    }

}

#Preview {
    let task = Task(name: "Eat Cereal")
    
    ProgView(task: task)
}
