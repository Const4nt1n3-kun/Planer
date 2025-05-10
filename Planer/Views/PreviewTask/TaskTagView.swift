import SwiftUI

struct TaskTagView: View {
    
    let tag: TagModel
    
    var body: some View {
        Text(tag.title)
            .font(.caption)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
           // .background(tag.color.opacity(0.2))
          //  .foregroundColor(tag.color)
            .cornerRadius(8)
    }
}

#Preview {
    let tag = TagModel(title: "", colorHex: "")
    TaskTagView(tag: tag)
}
