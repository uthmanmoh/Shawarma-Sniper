//
//  BusinessTitle.swift
//  City Sights App
//
//  Created by Uthman Mohamed on 2021-05-04.
//

import SwiftUI

struct BusinessTitle: View {
    var business: Business
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            Text(business.name ?? "")
                .bold()
                .font(.title2)
            if business.location?.displayAddress != nil {
                VStack (alignment: .leading, spacing: 0){
                    ForEach(business.location!.displayAddress!, id: \.self) { address in
                        Text(address)
                    }
                }
            }
            
            Image("regular_\(business.rating ?? 0)")
        }
    }
}

