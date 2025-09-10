import Foundation

/// Tracks how many consecutive days the user has opened the app.
final class StreakManager: ObservableObject {
    /// The current streak value exposed to views.
    @MainActor @Published private(set) var streak: Int = UserDefaults.standard.integer(forKey: "streak")

    /// Checks if the app has been opened today and updates streak.
    @MainActor
    func incrementIfNeeded() {
        let defaults = UserDefaults.standard
        let lastOpen = defaults.object(forKey: "lastOpenDate") as? Date
        let calendar = Calendar.current

        if lastOpen == nil || !calendar.isDateInToday(lastOpen!) {
            streak += 1
            defaults.set(streak, forKey: "streak")
        }
        defaults.set(Date(), forKey: "lastOpenDate")
    }
}
