//
//  CreateHypedEventView.swift
//  HypedList
//
//  Created by Ermal Bujupaj on 2.1.21.
//

import SwiftUI

struct CreateHypedEventView: View {
    
    @StateObject var hypedEvent = HypedEvent()
    @State var showTime = false
    @State var showImagePicker = false
    
    var body: some View {
        Form {
            Section {
                FormLabelView(title: "Title", iconName: "keyboard", backgroundColor: .orange)
                TextField("Family Vacation", text: $hypedEvent.title)
                    .autocapitalization(.words)
            }
            
            Section {
                FormLabelView(title: "Date", iconName: "calendar", backgroundColor: .blue)
                DatePicker("Date", selection: $hypedEvent.date, displayedComponents: showTime ? [.date, .hourAndMinute] : .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                Toggle(isOn: $showTime) {
                    FormLabelView(title: "Time", iconName: "clock.fill", backgroundColor: .blue)
                }
            }
            
            Section {
                Button(action: {
                    showImagePicker = true
                }) {
                    Text("Pick image")
                }.sheet(isPresented: $showImagePicker, content: {
                    ImagePicker()
                })
            }
            
            Section {
                ColorPicker(selection: $hypedEvent.color) {
                    FormLabelView(title: "Color Picker", iconName: "eyedropper", backgroundColor: .yellow)
                }
            }
                
            Section {
                FormLabelView(title: "URL Link", iconName: "link", backgroundColor: .orange)
                TextField("website", text: $hypedEvent.url)
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
