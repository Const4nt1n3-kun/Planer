import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        Text("Hello, World!")
    }
    
//    private func createFirestoreStructure(userId: String, name: String, email: String) {
//         let db = Firestore.firestore()
//         
//         // Проверяем, существует ли документ пользователя в коллекции users
//         let userRef = db.collection("users").document(userId)
//         
//         userRef.getDocument { (document, error) in
//             if let error = error {
//                 print("Ошибка при проверке документа пользователя: \(error.localizedDescription)")
//                 return
//             }
//             
//             // Если пользователь не существует, создаем новый документ и структуру
//             if !document!.exists {
//                 userRef.setData([
//                     "name": name,
//                     "email": email,
//                     "avatarUrl": "", // Ссылка на изображение (если есть)
//                     "createdAt": Timestamp(date: Date()),
//                     "updatedAt": Timestamp(date: Date())
//                 ]) { error in
//                     if let error = error {
//                         print("Ошибка при создании документа пользователя: \(error.localizedDescription)")
//                     } else {
//                         print("Документ пользователя успешно создан")
//                         
//                         // Создаем подколлекцию tasks, если нужно добавить начальные данные
//                         let tasksRef = userRef.collection("tasks")
//                         
//                         // Пример добавления начальной задачи для этого пользователя
//                         tasksRef.addDocument(data: [
//                             "title": "Начальная задача",
//                             "startTime": Timestamp(date: Date()),
//                             "endTime": Timestamp(date: Date().addingTimeInterval(3600)),
//                             "tags": ["важно"],
//                             "status": "pending", // Статус задачи
//                             "colorHex": "#FF5733", // Цвет задачи
//                             "ownerId": userId,
//                             "createdAt": Timestamp(date: Date()),
//                             "updatedAt": Timestamp(date: Date())
//                         ]) { error in
//                             if let error = error {
//                                 print("Ошибка при добавлении начальной задачи: \(error.localizedDescription)")
//                             } else {
//                                 print("Начальная задача успешно добавлена")
//                             }
//                         }
//                     }
//                 }
//             } else {
//                 print("Документ пользователя уже существует")
//             }
//         }
//     }
}

#Preview {
    SwiftUIView()
}
