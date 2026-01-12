//
//  NBANowApp.swift
//  NBANow
//
//  Created by alumne on 12/01/2026.
//

import SwiftUI

@main
struct NBANowApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
