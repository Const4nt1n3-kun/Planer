import SwiftUI

struct ActivityView: View {
    var data: [ActivityData]
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "chevron.left")
                    .foregroundColor(.gray)
                
                Spacer()
                
                Text("April 2021")
                    .font(.system(size: 18, weight: .bold))
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding(.bottom, 5)

            HStack(alignment: .bottom, spacing: 12) {
                ForEach(data) { item in
                    VStack {
                        ZStack(alignment: .bottom) {
                            Capsule()
                                .fill(Color.blue.opacity(0.3))
                                .frame(width: 10, height: item.values[0] * 2)
                            
                            Capsule()
                                .fill(Color.red.opacity(0.5))
                                .frame(width: 10, height: item.values[1] * 2)
                            
                            Capsule()
                                .fill(Color.cyan.opacity(0.7))
                                .frame(width: 10, height: item.values[2] * 2)
                        }
                        
                        Text(item.day)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.top, 10)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
    }
}


#Preview {
    let data = [ActivityData(values: [20, 40, 50], day: "asd")]
    ActivityView(data: data)
}
