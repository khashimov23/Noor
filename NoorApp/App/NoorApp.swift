//
//  NoorApp.swift
//  Noor
//
//  Created by Shavkat Khoshimov on 10/09/25.
//

import SwiftUI

/// Entry point of the application.
@main
struct NoorApp: App {
    private let container = AppDIContainer()

    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView(viewModel: container.makeHomeViewModel())
                    .tabItem { Label("Home", systemImage: "house") }

                CategoriesView(viewModel: container.makeCategoriesViewModel())
                    .tabItem { Label("Categories", systemImage: "list.bullet") }

                SettingsView(viewModel: container.makeSettingsViewModel())
                    .tabItem { Label("Settings", systemImage: "gear") }
            }
        }
    }
}
