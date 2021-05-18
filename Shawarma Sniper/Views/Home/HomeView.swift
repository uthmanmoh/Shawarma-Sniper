//
//  HomeView.swift
//  Shawarma Sniper
//
//  Created by Uthman Mohamed on 2021-05-04.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    @State private var isMapShowing = false
    @State private var selectedBusiness: Business?
    @State private var filter = ""
    
    var body: some View {
        
        NavigationView {
            if model.restaurants.count != 0{
                
                if !isMapShowing {
                    // List View
                    VStack (alignment: .leading){
                        HStack {
                            Image(systemName: "location")
                            Text(model.placemark?.locality ?? "")
                            Spacer()
                            Button("Switch to Map View") {
                                self.isMapShowing = true
                            }
                            .accentColor(.blue)
                        }
                        
                        SearchBar(text: $filter)
                        
                        ZStack (alignment: .top) {
                            BusinessList(filter: $filter)
                            HStack {
                                Spacer()
                                YelpAttribution(link: "https://yelp.ca")
                            }
                            .padding(.trailing, -20)
                        }
                        
                    }
                    .accentColor(Color(.label))
                    .padding([.horizontal, .top])
                    .navigationBarHidden(true)
                } else {
                    ZStack (alignment: .top) {
                        BusinessMap(selectedBusiness: $selectedBusiness)
                            .ignoresSafeArea()
                            .sheet(item: $selectedBusiness) { business in
                                BusinessDetailView(business: business)
                        }
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color(.label))
                                .colorInvert()
                                .frame(height: 48)
                            HStack {
                                Image(systemName: "location")
                                Text(model.placemark?.locality ?? "")
                                Spacer()
                                Button("Switch to List View") {
                                    self.isMapShowing = false
                                }
                            }
                            .padding()
                        }
                        .padding()
                    }
                }
                
            } else {
                ProgressView()
            }
        }
    }
}
