//
//  HypedEventView.swift
//  HypedList
//
//  Created by Ermal Bujupaj on 5.1.21.
//

import SwiftUI

struct HypedDetailEventView: View {
    
    @ObservedObject var hypedEvent: HypedEvent
    var isDiscover = false
    
    var body: some View {
        VStack(spacing: 0) {
            if hypedEvent.image() != nil {
                hypedEvent.image()!
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Rectangle()
                .foregroundColor(hypedEvent.color)
                .frame(height: 15)
            
            HStack {
                Text(hypedEvent.title)
                    .font(.title)
                    .padding(10)
                Spacer()
            }
            .background(Color.white)
            
            Text("\(hypedEvent.timeFromNow().capitalized) on \(hypedEvent.dateAsString())")
                .font(.title2)
            Spacer()
            
            if hypedEvent.validURL() != nil {
                Button(action: {
                    UIApplication.shared.open(hypedEvent.validURL()!, options: [UIApplication.OpenExternalURLOptionsKey.universalLinksOnly : (Any).self], completionHandler: nil)
                }) {
                    HypedEventDetailViewButton(backgroundColor: .orange, imageName: "link", text: "Visit Site")
                }
            }
            
            if isDiscover {
                Button(action: {
                    DataController.shared.addFromDiscover(hypedEvent: hypedEvent)
                }) {
                    HypedEventDetailViewButton(backgroundColor: .blue, imageName: "plus.circle", text: hypedEvent.hasBeenAdded ? "Added" : "Add")
                }
                .disabled(hypedEvent.hasBeenAdded)
                .opacity(hypedEvent.hasBeenAdded ? 0.5 : 1.0)
            } else {
                Button(action: {}) {
                    HypedEventDetailViewButton(backgroundColor: .green, imageName: "pencil.circle", text: "Edit")
                }
        
                Button(action: {
                    DataController.shared.deleteHypedEvent(hypedEvent: hypedEvent)
                }) {
                    HypedEventDetailViewButton(backgroundColor: .red, imageName: "trash", text: "Delete")
                }
            }
        }
    }
}

struct HypedEventDetailViewButton: View {
    
    var backgroundColor: Color
    var imageName: String
    var text: String
    
    var body: some View {
        HStack {
                Spacer()
                Image(systemName: imageName)
                Text(text)
                Spacer()
            }
            .font(.title2)
            .padding(12)
            .background(backgroundColor)
            .foregroundColor(.white)
            .cornerRadius(5.0)
            .padding(.horizontal, 20.0)
            .padding(.bottom)
    }
}

struct HypedDetailEventView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HypedDetailEventView(hypedEvent: testHypedEvent1)
            HypedEventDetailViewButton(backgroundColor: .orange, imageName: "link", text: "Visit Site")
        }
    }
}
