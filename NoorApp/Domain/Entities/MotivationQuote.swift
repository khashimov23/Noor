import Foundation

/// Domain entity representing a motivational quote.
/// Uses `Identifiable` for easy list rendering.
/// Conforms to `Codable` so quotes can be decoded from bundled JSON.
struct MotivationQuote: Identifiable, Codable, Equatable {
    // String identifiers make it easier to load simple JSON fixtures
    // while still conforming to `Identifiable` for list rendering.
    let id: String
    let text: String
    let author: String
    let category: QuoteCategory   // e.g. "Quran", "Hadith", "Scholar", "General"
    let date: Date
}
