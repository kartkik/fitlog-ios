//
//  fitlogApp.swift
//  fitlog
//
//  Created by 12345 on 22/11/2025.
//

import SwiftUI

@main
struct fitlogApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
