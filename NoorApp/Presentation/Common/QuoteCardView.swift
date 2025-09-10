import SwiftUI

/// Reusable card displaying a quote with subtle soft UI styling.
struct QuoteCardView: View {
    let quote: MotivationQuote

    var body: some View {
        VStack(spacing: 12) {
            Text(quote.text)
                .font(.title3)
                .multilineTextAlignment(.center)
            Text("— \(quote.author)")
                .font(.footnote)
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(.ultraThinMaterial)
                .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
        )
        .padding()
    }
}
