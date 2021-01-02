//
//  HypedListTabView.swift
//  HypedList
//
//  Created by Ermal Bujupaj on 2.1.21.
//

import SwiftUI

struct HypedListTabView: View {
    var body: some View {
        TabView {
            UpcomingView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Upcoming")
                }
            Text("Hello 2")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Discover")
                }
            Text("Hello 3")
                .tabItem {
                    Image(systemName: "gobackward")
                    Text("Past")
                }
        }
    }
}

struct HypedListTabView_Previews: PreviewProvider {
    static var previews: some View {
        HypedListTabView()
    }
}
