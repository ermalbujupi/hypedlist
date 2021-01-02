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
    var imageData: Data?
}
