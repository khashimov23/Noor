import Foundation

/// Simple dependency injection container.
final class AppDIContainer {
    // MARK: - Repositories
    private let quoteRepository: QuoteRepository = LocalQuoteRepository()

    // MARK: - Services
    private let notificationManager = NotificationManager()
    private let streakManager = StreakManager()

    // MARK: - Use Cases
    private lazy var fetchRandomQuoteUseCase = FetchRandomQuoteUseCase(repository: quoteRepository)
    private lazy var getQuotesByCategoryUseCase = GetQuotesByCategoryUseCase(repository: quoteRepository)

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
                          fetchRandomQuoteUseCase: fetchRandomQuoteUseCase)
    }
}
