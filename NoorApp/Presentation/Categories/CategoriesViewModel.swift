import Foundation

/// ViewModel that exposes quotes for a selected category.
@MainActor
final class CategoriesViewModel: ObservableObject {
    private let getQuotesByCategoryUseCase: GetQuotesByCategoryUseCase

    init(getQuotesByCategoryUseCase: GetQuotesByCategoryUseCase) {
        self.getQuotesByCategoryUseCase = getQuotesByCategoryUseCase
    }

    /// Loads all quotes for the provided category.
    func quotes(for category: QuoteCategory) async -> [MotivationQuote] {
        await getQuotesByCategoryUseCase.execute(category: category)
    }
}
