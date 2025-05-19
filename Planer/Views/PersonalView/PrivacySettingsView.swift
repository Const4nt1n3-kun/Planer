import SwiftUI

struct PrivacySettingsView: View {
    @AppStorage("app_language") private var appLanguage = "Русский"
    var body: some View {
          Form {
              Picker("Язык приложения", selection: $appLanguage) {
                  Text("Русский").tag("Русский")
                  Text("English").tag("English")
              }
          }
          .navigationTitle("Приватность")
      }
}

#Preview {
    PrivacySettingsView()
}
