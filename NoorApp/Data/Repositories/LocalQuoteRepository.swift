import Foundation

/// Repository that loads quotes from a bundled JSON file.
struct LocalQuoteRepository: QuoteRepository {
    private let quotes: [MotivationQuote]

    init(bundle: Bundle = .main) {
        if let url = bundle.url(forResource: "quotes", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            // Dates are stored as simple "yyyy-MM-dd" strings in the bundled JSON.
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            formatter.timeZone = TimeZone(secondsFromGMT: 0)
            decoder.dateDecodingStrategy = .formatted(formatter)
            quotes = (try? decoder.decode([MotivationQuote].self, from: data)) ?? []
        } else {
            quotes = []
        }
    }

    func fetchQuotes() async -> [MotivationQuote] {
        quotes
    }

    func getQuotesByCategory(_ category: String) async -> [MotivationQuote] {
        quotes.filter { $0.category == category }
    }
}
