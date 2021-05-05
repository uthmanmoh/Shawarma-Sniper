//
//  YelpAttribution.swift
//  City Sights App
//
//  Created by Uthman Mohamed on 2021-05-05.
//

import SwiftUI

struct YelpAttribution: View {
    
    var link: String
    
    var body: some View {
        Link(destination: URL(string: link)!) {
            Image("yelp")
                .resizable()
                .scaledToFit()
                .frame(height: 36)
        }
    }
}

struct YelpAttribution_Previews: PreviewProvider {
    static var previews: some View {
        YelpAttribution(link: "https://yelp.ca")
    }
}
