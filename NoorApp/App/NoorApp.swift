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
    @StateObject private var themeManager = ThemeManager()
    private lazy var container = AppDIContainer(themeManager: themeManager)

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
            .environmentObject(themeManager)
            .preferredColorScheme(themeManager.colorScheme)
        }
    }
}
