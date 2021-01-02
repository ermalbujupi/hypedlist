//
//  CreateHypedEventView.swift
//  HypedList
//
//  Created by Ermal Bujupaj on 2.1.21.
//

import SwiftUI

struct CreateHypedEventView: View {
    
    @StateObject var hypedEvent = HypedEvent()
    
    var body: some View {
        Form {
            Section {
                TextField("Family Vacation", text: $hypedEvent.title)
                    .autocapitalization(.words)
            }
            
            Section {
                DatePicker("Date", selection: $hypedEvent.date, displayedComponents: [.date, .hourAndMinute])
                    .datePickerStyle(GraphicalDatePickerStyle())
            }
            
            Section {
                ColorPicker("Color", selection: $hypedEvent.color)
            }
                
            Section {
                TextField("Website", text: $hypedEvent.url)
                    .keyboardType(.URL)
                    .autocapitalization(.none)
            }
        }
    }
}

struct CreateHypedEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateHypedEventView()
    }
}
