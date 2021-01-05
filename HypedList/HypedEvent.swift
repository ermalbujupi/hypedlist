//
//  HypedEvent.swift
//  HypedList
//
//  Created by Ermal Bujupaj on 2.1.21.
//

import Foundation
import SwiftUI
import SwiftDate

class HypedEvent: ObservableObject, Identifiable{
    var id = UUID().uuidString
    var date = Date()
    var title = ""
    var url = ""
    var color = Color.purple
    @Published var imageData: Data?
    
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
