//
//  HypedEvent.swift
//  HypedList
//
//  Created by Ermal Bujupaj on 2.1.21.
//

import Foundation
import SwiftUI
import SwiftDate
import UIColor_Hex_Swift

class HypedEvent: ObservableObject, Identifiable, Codable {
    var id = UUID().uuidString
    var date = Date()
    var title = ""
    var url = ""
    var color = Color.purple
    @Published var imageData: Data?
    
    enum CodingKeys: String, CodingKey {
        case id
        case date
        case title
        case url
        case color
        case imageData
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: CodingKeys.id)
        try container.encode(date, forKey: CodingKeys.date)
        try container.encode(title, forKey: CodingKeys.title)
        try container.encode(url, forKey: CodingKeys.url)
        try container.encode(UIColor(color).hexString(), forKey: CodingKeys.color)
        try container.encode(imageData, forKey: CodingKeys.imageData)
        
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        date = try values.decode(Date.self, forKey: .date)
        title = try values.decode(String.self, forKey: .title)
        url = try values.decode(String.self, forKey: .url)
        let colorHex = try values.decode(String.self, forKey: .color)
        color = Color(UIColor(colorHex))
        imageData = try? values.decode(Data.self, forKey: .imageData)
    }
    
    init() {}
    
    var hasBeenAdded: Bool {
        let hypedEvent = DataController.shared.hypedEvents.first { (hypedEvent) -> Bool in
            return hypedEvent.id == self.id
        }
        if hypedEvent != nil {
            return true
        }
        return false
    }
    
    func image() -> Image? {
        if let data = imageData, let image = UIImage(data: data) {
            return Image(uiImage: image)
        }
        return nil
    }
    
    func dateAsString() -> String {
        let formatter = DateFormatter()
        if date.compare(.isThisYear) {
            formatter.dateFormat = "MMM d"
        } else {
            formatter.dateFormat = "MMM d yyy"
        }
        
        return formatter.string(from: date)
    }
    
    func timeFromNow() -> String {
        return date.toRelative()
    }
    
    func validURL() -> URL? {
        return URL(string: url)
    }
}

var testHypedEvent1: HypedEvent {
    let hypedEvent = HypedEvent()
    
    hypedEvent.date = Date() + 6.days + 1.years
    hypedEvent.title = "WWDC 2021"
    
    let image = UIImage(named: "wwdc")
    if let image = image, let data = image.pngData() {
        hypedEvent.imageData = data
    }
    hypedEvent.color = .blue
    hypedEvent.url = "www.apple.com"
    
    return hypedEvent
}

var testHypedEvent2: HypedEvent {
    let hypedEvent = HypedEvent()
    hypedEvent.date = Date() + 2.hours + 25.minutes
    hypedEvent.title = "Family trip"
    hypedEvent.color = .green
    return hypedEvent
}
