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
                        .foregroundColor(business.isClosed! ? .red : .green)
                    
                    Text(business.isClosed! ? "Closed" : "Open")
                        .foregroundColor(.black)
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
                    if let phoneNum = business.displayPhone {
                        Text(phoneNum.isEmpty ? "Unavailable" : phoneNum)
                    } else {
                        Text("Unavailable")
                    }
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
                    Text(business.url ?? "Unavailable")
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
                        .foregroundColor(.green)
                        .padding()
                    Text("Get Directions")
                        .bold()
                        .foregroundColor(.black)
                }
            }
            .sheet(isPresented: $showDirections, content: {
                DirectionsView(business: business)
            })
        }

    }
}
