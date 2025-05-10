import SwiftUI


struct TaskCardView: View {
    
    let title: TaskCardModel
    let count: Int
    let color: Color
    let sizeMultiplier: CGFloat
    //let router: Router
    
    @State private var isPressed = false
    
    var body: some View {
        NavigationLink(destination: SwiftUIView()) {
            VStack( spacing: 10) {
                
                Image(systemName: title.imageName)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
                    .padding(.top)
                
                Text(title.rawValue)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text("\(count) Tasks")
                    .font(.subheadline)
                    .foregroundColor(.white)
                
                Spacer()
                
            }
            .padding()
            .frame(
                maxWidth: .infinity,
                minHeight: 130 * sizeMultiplier,
                maxHeight: 130 * sizeMultiplier
            )
            .background(color)
            .cornerRadius(20)
            .shadow(color: color.opacity(0.3), radius: 10, x: 0, y: 5)
            .scaleEffect(isPressed ? 0.97 : 1.0)
            .animation(.spring(), value: isPressed)
        }
     
    }
}

#Preview {
    TaskCardView(title: TaskCardModel.canceled, count: 12, color: .blue, sizeMultiplier: 1.2)
}
