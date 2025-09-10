import XCTest
@testable import NoorApp

final class SettingsViewModelTests: XCTestCase {
    private final class MockScheduler: NotificationScheduler {
        func scheduleDailyQuote(_ quote: MotivationQuote, at time: DateComponents) async { }
    }

    func testThemeSelectionUpdatesManager() {
        let scheduler = MockScheduler()
        let repo = MockQuoteRepository()
        let useCase = FetchRandomQuoteUseCase(repository: repo)
        let themeManager = ThemeManager()
        let vm = SettingsViewModel(notificationScheduler: scheduler,
                                   fetchRandomQuoteUseCase: useCase,
                                   themeManager: themeManager)

        vm.selectedTheme = .dark
        XCTAssertEqual(themeManager.selectedTheme, .dark)
    }
}
