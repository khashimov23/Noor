import SwiftUI

/// Manages the app's selected theme and exposes the corresponding `ColorScheme`.
final class ThemeManager: ObservableObject {
    /// Currently selected theme. Persisted for subsequent launches.
    @Published var selectedTheme: AppTheme {
        didSet { persist() }
    }

    init() {
        if let raw = UserDefaults.standard.string(forKey: Self.storageKey),
           let theme = AppTheme(rawValue: raw) {
            selectedTheme = theme
        } else {
            selectedTheme = .light
        }
    }

    /// Color scheme used by SwiftUI based on the selected theme.
    var colorScheme: ColorScheme {
        selectedTheme == .dark ? .dark : .light
    }

    private func persist() {
        UserDefaults.standard.set(selectedTheme.rawValue, forKey: Self.storageKey)
    }

    private static let storageKey = "selectedTheme"
}
