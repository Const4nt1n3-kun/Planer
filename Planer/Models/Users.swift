import Foundation
import FirebaseFirestore

struct UserModel: Identifiable, Decodable {
    @DocumentID var id: String? // uid из Firebase Auth
    var name: String
    var email: String
    var avatarURL: String?
    var createdAt: Date
  //  var language: String?
}
