import Foundation

/// Use case for fetching a random quote, optionally filtered by category.
struct FetchRandomQuoteUseCase {
    private let repository: QuoteRepository

    init(repository: QuoteRepository) {
        self.repository = repository
    }

    /// Returns a random quote.
    /// - Parameter category: Optional category to filter by.
    func execute(category: QuoteCategory? = nil) async -> MotivationQuote? {
        if let category = category {
            return await repository.quotes(category: category).randomElement()
        } else {
            return await repository.randomQuote()
        }
    }
}
