//
//  DataController.swift
//  HypedList
//
//  Created by Ermal Bujupaj on 5.1.21.
//

import Foundation

class DataController: ObservableObject {
    
    static var shared = DataController()
    
    @Published var hypedEvents: [HypedEvent] = []
}
