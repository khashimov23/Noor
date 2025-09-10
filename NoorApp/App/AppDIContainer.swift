import Foundation
import SwiftUI

/// Simple dependency injection container.
final class AppDIContainer {
    // MARK: - Services
    let themeManager: ThemeManager
    private let notificationManager = NotificationManager()
    private let streakManager = StreakManager()

    // MARK: - Repositories
    private let quoteRepository: QuoteRepository = LocalQuoteRepository()

    // MARK: - Use Cases
    private lazy var fetchRandomQuoteUseCase = FetchRandomQuoteUseCase(repository: quoteRepository)
    private lazy var getQuotesByCategoryUseCase = GetQuotesByCategoryUseCase(repository: quoteRepository)

    // MARK: - Init
    init(themeManager: ThemeManager = ThemeManager()) {
        self.themeManager = themeManager
    }

    // MARK: - Factory Methods
    func makeHomeViewModel() -> HomeViewModel {
        HomeViewModel(fetchRandomQuoteUseCase: fetchRandomQuoteUseCase,
                      notificationScheduler: notificationManager,
                      streakManager: streakManager)
    }

    func makeCategoriesViewModel() -> CategoriesViewModel {
        CategoriesViewModel(getQuotesByCategoryUseCase: getQuotesByCategoryUseCase)
    }

    func makeSettingsViewModel() -> SettingsViewModel {
        SettingsViewModel(notificationScheduler: notificationManager,
                          fetchRandomQuoteUseCase: fetchRandomQuoteUseCase,
                          themeManager: themeManager)
    }
}
