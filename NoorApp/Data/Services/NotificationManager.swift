import Foundation
import UserNotifications

/// Concrete implementation using `UserNotifications` to schedule daily reminders.
actor NotificationManager: NotificationScheduler {
    func scheduleDailyQuote(_ quote: MotivationQuote,
                            at time: DateComponents = DateComponents(hour: 8)) async {
        let content = UNMutableNotificationContent()
        content.title = "Daily Motivation"
        content.body = "\"\(quote.text)\" — \(quote.author)"

        let trigger = UNCalendarNotificationTrigger(dateMatching: time, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: trigger)
        do {
            try await UNUserNotificationCenter.current().add(request)
        } catch {
            // In production, handle errors appropriately.
            print("Failed to schedule notification: \(error)")
        }
    }
}
