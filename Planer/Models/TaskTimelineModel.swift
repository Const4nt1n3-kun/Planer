import Foundation

struct TaskTimelineModel: Identifiable {
    let id = UUID()
    let title: String
    let startDate: Date
    let endDate: Date
    let tags: [String]
}

