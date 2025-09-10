import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel: SettingsViewModel

    var body: some View {
        Form {
            DatePicker("Daily Notification", selection: $viewModel.notificationTime, displayedComponents: .hourAndMinute)
                .onChange(of: viewModel.notificationTime) { _ in viewModel.scheduleDailyNotification() }

            Picker("Theme", selection: $viewModel.selectedTheme) {
                ForEach(AppTheme.allCases) { theme in
                    Text(theme.rawValue.capitalized).tag(theme)
                }
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    SettingsView(viewModel: SettingsViewModel(notificationScheduler: NotificationManager(), fetchRandomQuoteUseCase: FetchRandomQuoteUseCase(repository: LocalQuoteRepository())))
}
