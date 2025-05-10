import Foundation
import FirebaseFirestore
import SwiftUI

struct TaskModel: Identifiable, Codable {
    @DocumentID var id: String? = UUID().uuidString
    var title: String
    var description: String?
    var startTime: Date
    var endTime: Date
    var tags: [TagModel]
    var status: TaskStatus
    var colorHex: String // Используем hex-код цвета
    var ownerId: String
    var createdAt: Date
    var updatedAt: Date
}


