import SwiftUI

struct CategoryModel: Identifiable {
    let id = UUID()
    let title: String
    let taskCount: Int
    let icon: String
    let color: Color
    
}

struct SettingRow: View {
    let option: SettingOption
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                Image(systemName: option.icon)
                    .foregroundColor(.primary)
                    .frame(width: 32, height: 32)
                    .background(option.color)
                    .clipShape(Circle())

                Text(option.title)
                    .font(.body)

                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
        }
    }
}




struct ProfileView: View {
    let user = UserModel(name: "Konstantine", email: "ConstantineGoit@gmail.com", createdAt: Date.now, lastLoginAt: Date.now)

       var body: some View {
           ScrollView {
               VStack(spacing: 24) {
                   // Аватар и имя
                   VStack(spacing: 8) {
                       Image("avatar") // Заменить на изображение пользователя
                           .resizable()
                           .frame(width: 80, height: 80)
                           .clipShape(Circle())

                       Text(user.name)
                           .font(.title2)
                           .bold()
                       Text(user.email)
                           .font(.subheadline)
                           .foregroundColor(.gray)
                   }

                   // Секция настроек
                   VStack(spacing: 16) {
                       ForEach(SettingOption.allCases, id: \.self) { option in
                           SettingRow(option: option) {
                               print("Tapped: \(option.title)")
                           }
                       }
                   }
                   .padding(.horizontal)
               }
               .padding()
           }
       }
}

#Preview {
    ProfileView()
}
