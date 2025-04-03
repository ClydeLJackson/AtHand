//
//  Project_JournalApp.swift
//  Project Journal
//
//  Created by Clyde Jackson on 3/17/25.
//

import SwiftUI
import SwiftData

@main

struct Project_JournalApp: App {
    
    var body: some Scene {
        WindowGroup {
           // ContentView()
            ContentView()
        }
        .modelContainer(for: Category.self)
    }
}
