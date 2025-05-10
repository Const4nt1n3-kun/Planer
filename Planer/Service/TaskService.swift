import Foundation
import FirebaseFirestore
import FirebaseAuth

enum DataBasePath: String {
    case users = "users"
    case tasks = "tasks"
}

protocol TaskServiceProtocol {
    func fetchTasks(for userId: String, completion: @escaping ([TaskModel]) -> Void)
}

final class TaskService: TaskServiceProtocol {
    private let db = Firestore.firestore()
    
    func fetchTasks(for userID: String, completion: @escaping ([TaskModel])-> Void ) {
        db.collection(DataBasePath.users.rawValue)
            .document(userID)
            .collection(DataBasePath.tasks.rawValue).addSnapshotListener { snapshot, error in
                if let error = error {
                    print("Error fetching tasks: \(error)")
                    completion([])
                    return
                }
                
                guard let documents = snapshot?.documents else {
                    completion([])
                    return
                }
                
                let task = documents.compactMap{ doc -> TaskModel? in
                    try? doc.data(as: TaskModel.self)
                }
                completion(task)
            }
    }
    
    func fetchUserData(completion: @escaping (UserModel?) -> Void) {
        guard let userID = Auth.auth().currentUser?.uid else {
            completion(nil)
            return
        }
        db.collection(DataBasePath.users.rawValue)
            .document(userID)
            .getDocument { snapshot, error in
                if let error = error {
                    print("Error fetching userData: \(error)")
                }
                guard let userData = try? snapshot?.data(as: UserModel.self) else {
                    completion(nil)
                    return
                }
                completion(userData)
            }
    }
}
