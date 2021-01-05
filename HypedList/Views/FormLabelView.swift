//
//  FormLabelView.swift
//  HypedList
//
//  Created by Ermal Bujupaj on 2.1.21.
//

import SwiftUI

struct FormLabelView: View {
   
    var title: String
    var iconName: String
    var backgroundColor: Color
    
    var body: some View {
        Label {
            Text(title)
        } icon: {
            Image(systemName: iconName)
                .padding(4)
                .background(backgroundColor)
                .cornerRadius(7)
                .foregroundColor(.white)
        }
    }
}

struct FormLabelView_Previews: PreviewProvider {
    static var previews: some View {
        FormLabelView(title: "", iconName: "", backgroundColor: .blue)
    }
}
