import SwiftUI

/// Displays the daily quote and streak information.
struct HomeView: View {
    @StateObject var viewModel: HomeViewModel

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                if let quote = viewModel.quote {
                    QuoteCardView(quote: quote)
                }

                Text("Streak: \(viewModel.streak) day\(viewModel.streak == 1 ? "" : "s")")
                    .font(.footnote)
                    .foregroundColor(.secondary)

                Button(action: viewModel.refresh) {
                    Label("Refresh", systemImage: "arrow.clockwise")
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .navigationTitle("Quote of the Day")
            .toolbar {
                if let quote = viewModel.quote {
                    ShareLink(item: "\"\(quote.text)\" — \(quote.author)")
                }
            }
        }
        .onAppear(perform: viewModel.onAppear)
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(
        fetchRandomQuoteUseCase: FetchRandomQuoteUseCase(repository: LocalQuoteRepository()),
        notificationScheduler: NotificationManager(),
        streakManager: StreakManager()
    ))
}
