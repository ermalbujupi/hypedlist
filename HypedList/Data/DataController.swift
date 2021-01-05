//
//  DataController.swift
//  HypedList
//
//  Created by Ermal Bujupaj on 5.1.21.
//

import Foundation
import SwiftDate
import UIColor_Hex_Swift
import SwiftUI

class DataController: ObservableObject {
    
    static var shared = DataController()
    
    @Published var hypedEvents: [HypedEvent] = []
    @Published var discoverHypedEvents: [HypedEvent] = []
    
    var upcomingHypedEvents: [HypedEvent] {
        return hypedEvents.filter { $0.date > Date().dateAt(.startOfDay) }.sorted(by: { $0.date < $1.date })
    }
    
    var pastHypedEvents: [HypedEvent] {
        return hypedEvents.filter { $0.date < Date().dateAt(.startOfDay) }.sorted(by: { $0.date < $1.date })
    }
    
    func saveData() {
        DispatchQueue.global().async {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(self.hypedEvents) {
                UserDefaults.standard.setValue(encoded, forKey: "hypedEvents")
            }
        }
    }
    
    func loadData() {
        DispatchQueue.global().async {
            if let data = UserDefaults.standard.data(forKey: "hypedEvents") {
                let decoder = JSONDecoder()
                if let jsonHypedEvents = try? decoder.decode([HypedEvent].self, from: data) {
                    DispatchQueue.main.async {
                        self.hypedEvents = jsonHypedEvents
                    }
                }
            }
        }
    }
    
    func getDiscoverEvents() {
//        https://api.jsonbin.io/b/5ff47cad14be54706019f926/latest
        if let url = URL(string: "https://api.jsonbin.io/b/5ff47cad14be54706019f926/latest") {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let data = data {
                    if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String: String]] {
                        
                        var hypedEventsToAdd: [HypedEvent] = []
                        
                        for jsonHypedEvent in json {
                            let hypedEvent = HypedEvent()
                            if let id = jsonHypedEvent["id"] {
                                hypedEvent.id = id
                            }
                            if let dateString = jsonHypedEvent["date"], let dateInRegion = dateString.toDate() {
                                hypedEvent.date = dateInRegion.date
                            }
                            if let title = jsonHypedEvent["title"] {
                                hypedEvent.title = title
                            }
                            if let url = jsonHypedEvent["url"] {
                                hypedEvent.url = url
                            }
                            if let colorHex = jsonHypedEvent["color"] {
                                hypedEvent.color = Color(UIColor(colorHex))
                            }
                            if let imageUrl = jsonHypedEvent["imageURL"] {
                                if let url = URL(string: imageUrl), let data = try? Data(contentsOf: url) {
                                    hypedEvent.imageData = data
                                }
                            }
                            
                            hypedEventsToAdd.append(hypedEvent)
                        }
                        DispatchQueue.main.async {
                            self.discoverHypedEvents = hypedEventsToAdd
                        }
                    }
                }
            }.resume()
        }
        
    }
}
