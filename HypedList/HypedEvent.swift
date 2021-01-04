//
//  HypedEvent.swift
//  HypedList
//
//  Created by Ermal Bujupaj on 2.1.21.
//

import Foundation
import SwiftUI

class HypedEvent: ObservableObject {
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
}

var testHypedEvent1: HypedEvent {
    let hypedEvent = HypedEvent()
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
    hypedEvent.title = "Family trip"
    hypedEvent.color = .green
    return hypedEvent
}
