//
//  MammamApp.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 01/10/24.
//

import SwiftData
import SwiftUI

@main
struct MammamApp: App {
    @StateObject private var coordinator = Coordinator()
    let dataController = DataController.shared

    @Environment(\.modelContext) private var context

    var body: some Scene {
        WindowGroup {
            CoordinatorView()
                .modelContainer(dataController.container)
                .onAppear {
                    dataController.initializeDataIfNeeded()
                }
        }
    }

    init() {
        print(URL.documentsDirectory.path())
    }
}
