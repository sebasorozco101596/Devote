//
//  DevoteApp.swift
//  Devote
//
//  Created by Juan Sebastian Orozco Buitrago on 2/10/22.
//

import SwiftUI

@main
struct DevoteApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
