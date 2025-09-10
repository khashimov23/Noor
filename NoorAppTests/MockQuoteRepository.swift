import Foundation
@testable import NoorApp

/// Simple mock repository returning static quotes for testing.
final class MockQuoteRepository: QuoteRepository {
    private let quotes: [MotivationQuote] = [
        MotivationQuote(id: "1", text: "A", author: "A", category: "Quran", date: Date()),
        MotivationQuote(id: "2", text: "B", author: "B", category: "Hadith", date: Date())
    ]

    func fetchQuotes() async -> [MotivationQuote] {
        quotes
    }

    func getQuotesByCategory(_ category: String) async -> [MotivationQuote] {
        quotes.filter { $0.category == category }
    }
}
