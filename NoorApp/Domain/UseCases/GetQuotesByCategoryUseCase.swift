import Foundation

/// Use case for retrieving all quotes belonging to a category.
struct GetQuotesByCategoryUseCase {
    private let repository: QuoteRepository

    init(repository: QuoteRepository) {
        self.repository = repository
    }

    /// Loads quotes for the given category.
    func execute(category: QuoteCategory) async -> [MotivationQuote] {
        await repository.quotes(category: category)
    }
}
