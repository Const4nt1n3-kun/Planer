//
//  NotificationSettingsView.swift
//  Planer
//
//  Created by Андрей Сорокин on 18.05.2025.
//

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
