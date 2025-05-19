import SwiftUI

struct NotificationSettingsView: View {
    @AppStorage("notifications_enabled") private var notificationsEnabled = true
    var body: some View {
        Form {
            Toggle("Получать уведомления", isOn: $notificationsEnabled)
        }
        .navigationTitle("Уведомления")
    }
}

#Preview {
    NotificationSettingsView()
}
