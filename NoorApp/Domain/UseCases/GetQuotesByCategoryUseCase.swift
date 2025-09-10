import Foundation

/// Use case for retrieving all quotes belonging to a category.
struct GetQuotesByCategoryUseCase {
    private let repository: QuoteRepository

    init(repository: QuoteRepository) {
        self.repository = repository
    }

    /// Loads quotes for the given category.
    func execute(category: String) async -> [MotivationQuote] {
        await repository.getQuotesByCategory(category)
    }
}
