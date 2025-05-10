import SwiftUI

struct HeaderView: View {
    let name: String
    let image: String
    
    private let subtitle: String = "Сделаем этот день продуктивным!"
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.largeTitle.bold())
                Text(subtitle)
                    .foregroundColor(.gray)
            }
            Spacer()
            Image(systemName: image)
                .resizable()
                .frame(width: 40, height: 40)
        }
        .padding()
    }
}

#Preview {
    HeaderView(name: "Konstantin", image: "person.circle")
}
