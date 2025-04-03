//
//  ProgressionView.swift
//  Project Journal
//
//  Created by Darian Murphy on 3/25/25.
//

import SwiftUI

struct ProgressionView: View {
    var category: Category
    @State private var progress: Double = 3/5
    @State private var completedTasks: Int = 0
    @State private var totalTasks: Int = 0 // Set the total number of tasks
    @State private var imageName = "kembasImage" // Replace with your image name
    @State var newLineWidth: CGFloat = 10
    @State var showPercent: Bool = false

    var body: some View {
        
        
        VStack {
            ZStack {
                // Background Circle (Track)
                Circle()
                    .stroke(Color.gray.opacity(0.3), lineWidth: newLineWidth)
                    .frame(maxWidth: 200, maxHeight: 200)
                    .frame(minWidth: 50, minHeight: 50)

                // Foreground Circle (Progress)
                Circle()
                    .trim(from: 0, to: CGFloat(progress))
                    .stroke(AngularGradient(gradient: Gradient(colors: [.green, .blue]), center: .center), lineWidth: newLineWidth)
                    .rotationEffect(.degrees(-90)) // Start the circle from the top
                    .frame(maxWidth: 200, maxHeight: 200)
                    .frame(minWidth: 50, minHeight: 50)

                // Image filling the entire inside of the circle
                Image(imageName) // Replace with your image name
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle()) // Clip the image to a circular shape
                    .frame(maxWidth: 200, maxHeight: 200)
                    .frame(minWidth: 50, minHeight: 50) // Set the size of the image to fully fill the circle

                // Progress label on top of the image

                Text(!showPercent ? "\(category.name)" : "\(Int(progress * 100))%")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.white)
                    .onHover(){ show in
                        showPercent = show
                    }
            }
            
            .padding()
            .onGeometryChange(for: CGRect.self){ geo in
                geo.frame(in: .global)
            }action: { newValue in
                newLineWidth = CGFloat(5 * (newValue.width/200) )
                print(newValue.width)
                print(newLineWidth)
            }
            //.border(.green)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressionView(category: Category(name: "Design", task: []))
    }
}
