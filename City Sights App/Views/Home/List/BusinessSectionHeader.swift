//
//  BusinessSectionHeader.swift
//  City Sights App
//
//  Created by Uthman Mohamed on 2021-05-04.
//

import SwiftUI

struct BusinessSectionHeader: View {
    
    var title: String
    
    var body: some View {
        ZStack (alignment: .leading) {
            Rectangle()
                .foregroundColor(Color(.label))
                .colorInvert()
            Text(title)
                .font(.headline)
        }
    }
}

struct BusinessSectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        BusinessSectionHeader(title: "Restaurants")
    }
}
