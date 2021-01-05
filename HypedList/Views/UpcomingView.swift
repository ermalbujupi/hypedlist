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
        HypedEventListView(hypedEvents: data.upcomingHypedEvents, noEventsText: "Nothing to look forward to 😥 \n  Create an event or check out the discover tab!")
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
        UpcomingView()
    }
}
