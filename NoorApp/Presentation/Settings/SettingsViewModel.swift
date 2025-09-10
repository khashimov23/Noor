import Foundation
import SwiftUI

/// Themes supported by the app.
enum AppTheme: String, CaseIterable, Identifiable {
    case light, dark
    var id: String { rawValue }
}

/// ViewModel backing the Settings screen.
@MainActor
final class SettingsViewModel: ObservableObject {
    @Published var notificationTime: Date
    @Published var selectedTheme: AppTheme {
        didSet { themeManager.selectedTheme = selectedTheme }
    }

    private let notificationScheduler: NotificationScheduler
    private let fetchRandomQuoteUseCase: FetchRandomQuoteUseCase
    private let themeManager: ThemeManager

    init(notificationScheduler: NotificationScheduler,
         fetchRandomQuoteUseCase: FetchRandomQuoteUseCase,
         themeManager: ThemeManager) {
        self.notificationScheduler = notificationScheduler
        self.fetchRandomQuoteUseCase = fetchRandomQuoteUseCase
        self.themeManager = themeManager
        self.selectedTheme = themeManager.selectedTheme
        self.notificationTime = Calendar.current.date(bySettingHour: 8, minute: 0, second: 0, of: Date())!
    }

    /// Reschedules the daily notification based on the chosen time.
    func scheduleDailyNotification() {
        Task {
            if let quote = await fetchRandomQuoteUseCase.execute() {
                let components = Calendar.current.dateComponents([.hour, .minute], from: notificationTime)
                await notificationScheduler.scheduleDailyQuote(quote, at: components)
            }
        }
    }
}
