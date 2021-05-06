//
//  BusinessList.swift
//  Shawarma Sniper
//
//  Created by Uthman Mohamed on 2021-05-04.
//

import SwiftUI

struct BusinessList: View {
    
    @EnvironmentObject var model: ContentModel
    @Binding var filter: String
    
    var body: some View {
        ScrollView (showsIndicators: false) {
            LazyVStack (alignment: .leading, pinnedViews: [.sectionHeaders]) {
                Section (header: BusinessSectionHeader(title: "Restaurants")) {
                    ForEach(model.restaurants.filter({ business in
                        if business.name != nil {
                            return business.name!.lowercased().contains(filter.lowercased()) || filter.isEmpty
                        } else {
                            return false
                        }
                    })) { business in
                        
                        NavigationLink(
                            destination: BusinessDetailView(business: business),
                            label: {
                                BusinessRow(business: business)
                            })
                        
                    }
                }
            }
        }
    }
}
