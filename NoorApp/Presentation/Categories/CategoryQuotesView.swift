import SwiftUI

/// Displays all quotes for a given category.
struct CategoryQuotesView: View {
    let category: QuoteCategory
    @ObservedObject var viewModel: CategoriesViewModel
    @State private var quotes: [MotivationQuote] = []

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(quotes) { quote in
                    QuoteCardView(quote: quote)
                }
            }
            .padding()
        }
        .navigationTitle(category.rawValue)
        .task {
            quotes = await viewModel.quotes(for: category)
        }
    }
}

#Preview {
    CategoryQuotesView(
        category: .quran,
        viewModel: CategoriesViewModel(getQuotesByCategoryUseCase: GetQuotesByCategoryUseCase(repository: LocalQuoteRepository()))
    )
}
