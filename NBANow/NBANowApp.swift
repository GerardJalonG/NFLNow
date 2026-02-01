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
    @StateObject private var storePlayers = FollowingPlayersStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(storePlayers)
        }
    }
}
