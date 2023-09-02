//
//  Pokedex_PlatziApp.swift
//  Pokedex-Platzi
//
//  Created by Camilo Lezcano on 2/09/23.
//

import SwiftUI

@main
struct Pokedex_PlatziApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
