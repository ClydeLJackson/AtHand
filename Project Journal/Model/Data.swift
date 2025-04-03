//
//  Data.swift
//  Project Journal
//
//  Created by Clyde Jackson on 3/17/25.
//
import Foundation
import Observation
import SwiftData

@Model
class Category{
    var id: UUID
    var name: String
    var tasks: [Task]
    
    init(name: String,task: [Task]) {
        self.id = UUID()
        self.name = name
        self.tasks = task
    }
    
}

@Observable class SelectedCategory{
    var category : Category?
    var activeOverview: Bool = false
}

struct Task: Identifiable, Codable{
    var id: UUID = UUID()
    var name: String
    //var categoryTag: String
    var description: String = ""
    var isCompleted: Bool = false
    
}
