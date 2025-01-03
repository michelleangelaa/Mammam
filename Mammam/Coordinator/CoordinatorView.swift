//
//  CoordinatorView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 15/10/24.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject private var coordinator = Coordinator()
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false // Track login state

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            if isLoggedIn {
                coordinator.build(page: .main)
                    .navigationDestination(for: AppPages.self) { page in
                        coordinator.build(page: page)
                    }
                    .sheet(item: $coordinator.sheet) { sheet in
                        coordinator.buildSheet(sheet: sheet)
                    }
                    .fullScreenCover(item: $coordinator.fullScreenCover) { item in
                        coordinator.buildCover(cover: item)
                    }
            } else {
                coordinator.build(page: .splashScreen)
                    .navigationDestination(for: AppPages.self) { page in
                        coordinator.build(page: page)
                    }
                    .sheet(item: $coordinator.sheet) { sheet in
                        coordinator.buildSheet(sheet: sheet)
                    }
                    .fullScreenCover(item: $coordinator.fullScreenCover) { item in
                        coordinator.buildCover(cover: item)
                    }
            }
        }
        .environmentObject(coordinator)
    }
}

#Preview {
    CoordinatorView()
}
