//
//  BusinessSection.swift
//  City Sights App
//
//  Created by Uthman Mohamed on 2021-05-04.
//

import SwiftUI

struct BusinessSection: View {
    
    var businesses: [Business]
    var title: String
    
    var body: some View {
        Section (header: BusinessSectionHeader(title: title)) {
            ForEach(businesses) { business in
                Text(business.name ?? "")
                Divider()
            }
        }
    }
}

