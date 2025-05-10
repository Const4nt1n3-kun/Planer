import Foundation
import FirebaseFirestore

struct UserModel: Identifiable, Codable {
    @DocumentID var id: String? // uid из Firebase Auth
    var name: String
    var email: String
    var avatarURL: String?
    var createdAt: Date
    var lastLoginAt: Date
    var language: String?
}
