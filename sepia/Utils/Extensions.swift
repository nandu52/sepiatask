//
//  Extensions.swift
//  sepia
//
//  Created by Kandula Anand kumar on 30/11/22.
//

import Foundation
import UIKit

extension UIImageView {
    func loadFrom(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        DispatchQueue.global().async {
            [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self?.image = loadedImage
                    }
                }
            }
        }
    }
}

extension Date {

 static func getCurrentDate() -> String {

     let date = Date()
     let dateFormatter = DateFormatter()
     dateFormatter.dateFormat = "EEEE, HH:mm"
     //let currentDateString: String = dateFormatter.string(from: date)
     
     return dateFormatter.string(from: Date())

    }
    enum WeekDay: Int {
            case sunday
            case monday
            case tuesday
            case wednesday
            case thursday
            case friday
            case saturday
        }

        func getWeekDay() -> WeekDay {
            let calendar = Calendar.current
            let weekDay = calendar.component(Calendar.Component.weekday, from: self)
            return WeekDay(rawValue: weekDay)!
        }
}

extension Formatter {
    static let today: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .init(identifier: "en_US_POSIX")
        dateFormatter.defaultDate = Calendar.current.startOfDay(for: Date())
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter
        
        }()
}

