import Foundation
import FirebaseAuth

final class AuthService {
    static let shared = AuthService()
    
    private init () {}
    
    func signOut(completion: @escaping (Result<Void, Error>) -> Void) {
           do {
               try Auth.auth().signOut()
               completion(.success(()))
           } catch {
               completion(.failure(error))
           }
       }
    
    func deleteAccount(completion: @escaping (Result<Void, Error>) -> Void) {
        guard let user = Auth.auth().currentUser else {
            completion(.failure(NSError(domain: "No user", code: 0)))
            return
        }

        user.delete { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
    
}
