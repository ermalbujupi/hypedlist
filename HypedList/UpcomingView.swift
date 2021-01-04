//
//  UpcomingView.swift
//  HypedList
//
//  Created by Ermal Bujupaj on 2.1.21.
//

import SwiftUI

struct UpcomingView: View {
    
    @State var showingCreateView = false
    var hypedEvents: [HypedEvent] = []
    
    var body: some View {
        VStack {
            if hypedEvents.count == 0 {
                Text("Nothing to look forward to 😥 \n  Create an event or check out the discover tab!")
                    .bold()
                    .multilineTextAlignment(.center)
            } else {
                
            }
        }
        .navigationTitle("Upcoming")
        .navigationBarItems(trailing:
                                Button(action: {
                                    showingCreateView = true
                                }) {
                                    Image(systemName: "calendar.badge.plus")
                                        .font(.title)
                                }
            .sheet(isPresented: $showingCreateView) {
                CreateHypedEventView()
            }
        )
    }
}

struct UpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UpcomingView(hypedEvents: [testHypedEvent1, testHypedEvent2])
            UpcomingView()
        }
    }
}
