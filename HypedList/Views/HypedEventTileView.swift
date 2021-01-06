//
//  HypedEventTileView.swift
//  HypedList
//
//  Created by Ermal Bujupaj on 4.1.21.
//

import SwiftUI

struct HypedEventTileView: View {
    
    @ObservedObject var hypedEvent: HypedEvent
    
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
            
            HStack {
                Image(systemName: "calendar")
                    .foregroundColor(.red)
                Text(hypedEvent.dateAsString())
                Spacer()
                Text(hypedEvent.timeFromNow())
                Image(systemName: "clock.fill")
                    .foregroundColor(.blue)
            }
            .padding(.horizontal, 10)
            .font(.title3)
            .padding(.bottom, 10)
            .background(Color.white)
        }
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding()
    }
}

struct HypedEventTileView_Previews: PreviewProvider {
    static var previews: some View {
        HypedEventTileView(hypedEvent: testHypedEvent1).previewLayout(.sizeThatFits)
    }
}
