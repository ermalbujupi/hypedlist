//
//  UpcomingView.swift
//  HypedList
//
//  Created by Ermal Bujupaj on 2.1.21.
//

import SwiftUI

struct UpcomingView: View {
    
    @State var showingCreateView = false
    @ObservedObject var data = DataController.shared
    
    var body: some View {
        ScrollView {
            VStack {
                if data.hypedEvents.count == 0 {
                    Text("Nothing to look forward to 😥 \n  Create an event or check out the discover tab!")
                        .bold()
                        .multilineTextAlignment(.center)
                } else {
                    ForEach(data.hypedEvents) { hypedEvent in
                        HypedEventTileView(hypedEvent: hypedEvent)
                    }
                }
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
//            UpcomingView()
        }
    }
}
