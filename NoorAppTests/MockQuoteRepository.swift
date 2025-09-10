import Foundation
@testable import NoorApp

/// Simple mock repository returning static quotes for testing.
final class MockQuoteRepository: QuoteRepository {
    private let quotes: [MotivationQuote] = [
        MotivationQuote(id: "1", text: "A", author: "A", category: .quran, date: Date()),
        MotivationQuote(id: "2", text: "B", author: "B", category: .hadith, date: Date())
    ]

    func allQuotes() async throws -> [MotivationQuote] { quotes }

    func randomQuote() async -> MotivationQuote? { quotes.randomElement() }

    func quotes(category: QuoteCategory) async -> [MotivationQuote] {
        quotes.filter { $0.category == category }
    }
}
