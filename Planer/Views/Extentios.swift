import Foundation

extension Calendar {
    func startOfWeek(for date: Date) -> Date {
        let comps = self.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date)
        return self.date(from: comps)!
    }
}

extension Date {
    var dayFormatted: String {
        DateFormatter.day.string(from: self)
    }
    
    var weekdaySymbol: String {
        DateFormatter.weekdayShort.string(from: self)
    }
}

extension DateFormatter {
    static let day: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "d"
        return df
    }()
    
    static let weekdayShort: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "EE"
        return df
    }()
}


extension Date {
    func timeString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: self)
    }
}
