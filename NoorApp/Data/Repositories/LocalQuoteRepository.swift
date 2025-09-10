import Foundation

/// Errors that can occur while loading local quotes.
enum QuoteRepositoryError: Error {
    case fileNotFound
}

/// Repository that loads quotes from a bundled JSON file.
struct LocalQuoteRepository: QuoteRepository {
    private let bundle: Bundle

    init(bundle: Bundle = .main) {
        self.bundle = bundle
    }

    func allQuotes() async throws -> [MotivationQuote] {
        guard let url = bundle.url(forResource: "quotes", withExtension: "json") else {
            throw QuoteRepositoryError.fileNotFound
        }
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        // Dates are stored as simple "yyyy-MM-dd" strings in the bundled JSON.
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        decoder.dateDecodingStrategy = .formatted(formatter)
        return try decoder.decode([MotivationQuote].self, from: data)
    }

    func randomQuote() async -> MotivationQuote? {
        guard let quotes = try? await allQuotes() else { return nil }
        return quotes.randomElement()
    }

    func quotes(category: QuoteCategory) async -> [MotivationQuote] {
        guard let quotes = try? await allQuotes() else { return [] }
        return quotes.filter { $0.category == category }
    }
}
