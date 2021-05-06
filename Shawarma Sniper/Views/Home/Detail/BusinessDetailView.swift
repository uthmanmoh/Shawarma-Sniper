//
//  BusinessDetailView.swift
//  Shawarma Sniper
//
//  Created by Uthman Mohamed on 2021-05-04.
//

import SwiftUI

struct BusinessDetailView: View {
    
    var business: Business
    @State private var showDirections = false
    
    var body: some View {
        VStack (alignment: .leading) {
            
            let uiImage = UIImage(data: business.imageData ?? Data())
            VStack (alignment: .leading, spacing: 0) {
                GeometryReader { geo in
                    Image(uiImage: uiImage ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                }
                .ignoresSafeArea(.all, edges: .top)
                
                ZStack (alignment: .leading) {
                    Rectangle()
                        .frame(height: 36)
                        .foregroundColor(business.isClosed! ? .gray : .blue)
                    
                    Text(business.isClosed! ? "Closed" : "Open")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
            }
            
            VStack (alignment: .leading, spacing: 15) {
                HStack {
                    BusinessTitle(business: business)
                    Spacer()
                    YelpAttribution(link: business.url!)
                }
                .padding(.trailing, -20)
                
                DashedDivider()
                    .padding(.vertical)
                
                HStack {
                    Text("Phone: ")
                        .bold()
                    Text(business.displayPhone ?? "")
                    Spacer()
                    Link("Call", destination: URL(string: "tel:\(business.phone ?? "")")!)
                        .accentColor(.blue)
                }
                
                DashedDivider()
                    .padding(.vertical)
                
                HStack {
                    Text("Reviews: ")
                        .bold()
                    Text("\(business.reviewCount ?? 0)")
                    Spacer()
                    Link("Read", destination: URL(string: "\(business.url ?? "")")!)
                        .accentColor(.blue)
                }
                
                DashedDivider()
                    .padding(.vertical)
                
                HStack {
                    Text("Website: ")
                        .bold()
                    Text(business.url ?? "")
                    Spacer()
                    Link("Visit", destination: URL(string: "\(business.url ?? "")")!)
                        .accentColor(.blue)
                }
                
                DashedDivider()
                    .padding(.vertical)
            }
            .padding()
            
            Button(action: {
                showDirections = true
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 48)
                        .foregroundColor(.blue)
                        .padding()
                    Text("Get Directions")
                        .bold()
                        .foregroundColor(.white)
                }
            }
            .sheet(isPresented: $showDirections, content: {
                DirectionsView(business: business)
            })
        }
    }
}
