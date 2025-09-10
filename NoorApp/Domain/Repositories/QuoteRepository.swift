import Foundation

/// Abstraction for fetching quotes.
protocol QuoteRepository {
    /// Retrieves all available quotes.
    func fetchQuotes() async -> [MotivationQuote]

    /// Returns quotes matching a specific category.
    func getQuotesByCategory(_ category: String) async -> [MotivationQuote]
}
