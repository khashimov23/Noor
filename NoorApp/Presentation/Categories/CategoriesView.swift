import SwiftUI

struct CategoriesView: View {
    @StateObject var viewModel: CategoriesViewModel
    private let categories = ["Quran", "Hadith", "Scholar", "General"]

    var body: some View {
        NavigationStack {
            List {
                ForEach(categories, id: \.self) { category in
                    NavigationLink(destination: CategoryQuotesView(category: category, viewModel: viewModel)) {
                        Text(category)
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .fill(.ultraThinMaterial)
                                    .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
                            )
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Categories")
        }
    }
}

#Preview {
    CategoriesView(viewModel: CategoriesViewModel(getQuotesByCategoryUseCase: GetQuotesByCategoryUseCase(repository: LocalQuoteRepository())))
}
