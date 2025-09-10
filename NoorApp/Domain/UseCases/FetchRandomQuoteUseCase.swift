import Foundation

/// Use case for fetching a random quote, optionally filtered by category.
struct FetchRandomQuoteUseCase {
    private let repository: QuoteRepository

    init(repository: QuoteRepository) {
        self.repository = repository
    }

    /// Returns a random quote.
    /// - Parameter category: Optional category to filter by.
    func execute(category: String? = nil) async -> MotivationQuote? {
        let allQuotes = await repository.fetchQuotes()
        let filtered = category.map { cat in
            allQuotes.filter { $0.category == cat }
        } ?? allQuotes
        return filtered.randomElement()
    }
}
