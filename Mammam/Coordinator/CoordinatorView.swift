//
//  CoordinatorView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 15/10/24.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject private var coordinator = Coordinator()
    
    
    var body: some View {
        NavigationStack (path: $coordinator.path) {
            coordinator.build(page: .splashScreen)
                .navigationDestination(for: AppPages.self) {
                    page in coordinator.build(page: page)
                }
                .sheet(item: $coordinator.sheet) { sheet in
                    coordinator.buildSheet(sheet: sheet)
                }
                .fullScreenCover(item: $coordinator.fullScreenCover) {
                    item in
                    coordinator.buildCover(cover: item)
                }
        }
        .environmentObject(coordinator)
        
    }
}

#Preview {
    CoordinatorView()
}
