import Foundation

/// ViewModel for the Home screen.
@MainActor
final class HomeViewModel: ObservableObject {
    @Published var quote: MotivationQuote?
    @Published var streak: Int = 0

    private let fetchRandomQuoteUseCase: FetchRandomQuoteUseCase
    private let notificationScheduler: NotificationScheduler
    private let streakManager: StreakManager

    init(fetchRandomQuoteUseCase: FetchRandomQuoteUseCase,
         notificationScheduler: NotificationScheduler,
         streakManager: StreakManager) {
        self.fetchRandomQuoteUseCase = fetchRandomQuoteUseCase
        self.notificationScheduler = notificationScheduler
        self.streakManager = streakManager
    }

    /// Called when the view appears.
    func onAppear() {
        streakManager.incrementIfNeeded()
        streak = streakManager.streak
        Task { await loadDailyQuote() }
    }

    /// Loads a random daily quote and schedules a notification.
    func loadDailyQuote() async {
        quote = await fetchRandomQuoteUseCase.execute()
        if let quote = quote {
            await notificationScheduler.scheduleDailyQuote(quote, at: DateComponents(hour: 8))
        }
    }

    /// Refreshes the quote manually.
    func refresh() {
        Task { await loadDailyQuote() }
    }
}
