import Foundation

/// Represents supported quote categories.
enum QuoteCategory: String, CaseIterable, Codable {
    case quran = "Quran"
    case hadith = "Hadith"
    case scholar = "Scholar"
    case general = "General"
}
