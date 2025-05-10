import Foundation
import FirebaseFirestore
import SwiftUI

struct TaskModel: Identifiable, Codable {
    @DocumentID var id: String? = UUID().uuidString
    var title: String
    var descriprion: String
    var startTime: Date
    var endTime: Date
    var tags: [String]          // Простой список названий тегов
    var status: TaskStatus
    var colorHex: String
    var ownerId: String
    var createdAt: Date
    var updatedAt: Date
}
