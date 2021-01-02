//
//  UpcomingView.swift
//  HypedList
//
//  Created by Ermal Bujupaj on 2.1.21.
//

import SwiftUI

struct UpcomingView: View {
    
    @State var showingCreateView = false
    
    var body: some View {
        Text("Upcoming!")
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
