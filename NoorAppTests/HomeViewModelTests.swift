import XCTest
@testable import NoorApp

final class HomeViewModelTests: XCTestCase {
    func testLoadDailyQuote() async {
        let repository = MockQuoteRepository()
        let vm = HomeViewModel(
            fetchRandomQuoteUseCase: FetchRandomQuoteUseCase(repository: repository),
            notificationScheduler: MockNotificationScheduler(),
            streakManager: StreakManager()
        )
        await vm.loadDailyQuote()
        XCTAssertNotNil(vm.quote)
    }
}

final class MockNotificationScheduler: NotificationScheduler {
    func scheduleDailyQuote(_ quote: MotivationQuote, at time: DateComponents) async { }
}
