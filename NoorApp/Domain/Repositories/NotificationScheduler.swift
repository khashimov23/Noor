import Foundation

/// Abstraction for scheduling notifications.
protocol NotificationScheduler {
    func scheduleDailyQuote(_ quote: MotivationQuote, at time: DateComponents) async
}
