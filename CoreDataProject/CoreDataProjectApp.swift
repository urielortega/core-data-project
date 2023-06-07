//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Uriel Ortega on 05/06/23.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext) // Injecting dataController into the environment.
        }
    }
}
