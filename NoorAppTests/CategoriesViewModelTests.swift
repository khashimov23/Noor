import XCTest
@testable import NoorApp

final class CategoriesViewModelTests: XCTestCase {
    func testQuotesByCategory() async {
        let repository = MockQuoteRepository()
        let useCase = GetQuotesByCategoryUseCase(repository: repository)
        let vm = CategoriesViewModel(getQuotesByCategoryUseCase: useCase)
        let quotes = await vm.quotes(for: .quran)
        XCTAssertEqual(quotes.count, 1)
        XCTAssertEqual(quotes.first?.category, .quran)
    }
}
