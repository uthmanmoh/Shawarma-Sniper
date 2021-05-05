//
//  HomeView.swift
//  City Sights App
//
//  Created by Uthman Mohamed on 2021-05-04.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    @State private var isMapShowing = false
    @State private var selectedBusiness: Business?
    
    var body: some View {
        
        NavigationView {
            if model.restaurants.count != 0 || model.sights.count != 0 {
                
                if !isMapShowing {
                    // List View
                    VStack (alignment: .leading){
                        HStack {
                            Image(systemName: "location")
                            Text("San Francisco")
                            Spacer()
                            Button("Switch to map view") {
                                self.isMapShowing = true
                            }
                            .accentColor(.blue)
                        }
                        Divider()
                        BusinessList()
                    }
                    .accentColor(Color(.label))
                    .padding([.horizontal, .top])
                    .navigationBarHidden(true)
                } else {
                    BusinessMap(selectedBusiness: $selectedBusiness)
                        .ignoresSafeArea()
                        .sheet(item: $selectedBusiness) { business in
                            BusinessDetailView(business: business)
                        }
                }
                
            } else {
                ProgressView()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
