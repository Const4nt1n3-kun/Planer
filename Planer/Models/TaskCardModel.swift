import Foundation

enum TaskCardModel: String  {
    case completed = "Завершены"
    case canceled = "Отменены"
    case pending = "В процессе"
    case onGoing = "Исполняются"
    
    var imageName: String {
        switch self {
        case .completed: "checkmark.circle.fill"
        case .canceled: "xmark.circle.fill"
        case .pending: "clock.fill"
        case .onGoing: "hare.fill"
        }
    }
    
}
