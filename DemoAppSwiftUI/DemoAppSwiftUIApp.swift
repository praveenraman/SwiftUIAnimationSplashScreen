//
//  DemoAppSwiftUIApp.swift
//  DemoAppSwiftUI
//
//  Created by iOS Developer on 25/09/23.
//

import SwiftUI

@main
struct DemoAppSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
