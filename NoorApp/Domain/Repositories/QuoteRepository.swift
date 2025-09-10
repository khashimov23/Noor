import Foundation

/// Abstraction for fetching quotes.
protocol QuoteRepository {
    /// Retrieves all available quotes.
    func allQuotes() async throws -> [MotivationQuote]

    /// Returns a random quote if available.
    func randomQuote() async -> MotivationQuote?

    /// Returns quotes matching a specific category.
    func quotes(category: QuoteCategory) async -> [MotivationQuote]
}
