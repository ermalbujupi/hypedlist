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
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
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
                    if hypedEvent.image() == nil {
                        HStack {
                            FormLabelView(title: "Image", iconName: "camera", backgroundColor: .purple)
                            Spacer()
                            Button(action: {
                                showImagePicker = true
                            }) {
                                Text("Pick image")
                            }.sheet(isPresented: $showImagePicker, content: {
                                ImagePicker(imageData: $hypedEvent.imageData)
                            })
                            .buttonStyle(BorderlessButtonStyle())
                        }
                    } else {
                        HStack {
                            FormLabelView(title: "Image", iconName: "camera", backgroundColor: .purple)
                            Spacer()
                            Button(action: {
                                hypedEvent.imageData = nil
                            }) {
                                Text("Remove image")
                                    .foregroundColor(.red)
                            }
                        }
                        Button(action: {
                            showImagePicker = true
                        }) {
                            hypedEvent.image()!
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }.sheet(isPresented: $showImagePicker, content: {
                            ImagePicker(imageData: $hypedEvent.imageData)
                        })
                        .buttonStyle(BorderlessButtonStyle())
                    }
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
            .navigationBarItems(leading: Button(action: {
                 presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Cancel")
            }), trailing: Button(action: {
                DataController.shared.hypedEvents.append(hypedEvent)
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Done")
            }))
            .navigationTitle("Create")
        }
    }
}

struct CreateHypedEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateHypedEventView()
    }
}
