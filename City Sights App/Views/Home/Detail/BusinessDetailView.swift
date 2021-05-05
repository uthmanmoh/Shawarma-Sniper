//
//  BusinessDetailView.swift
//  City Sights App
//
//  Created by Uthman Mohamed on 2021-05-04.
//

import SwiftUI

struct BusinessDetailView: View {
    
    var business: Business
    
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
                Text(business.name ?? "")
                    .font(.largeTitle)
                if business.location?.displayAddress != nil {
                    VStack (alignment: .leading, spacing: 0){
                        ForEach(business.location!.displayAddress!, id: \.self) { address in
                            Text(address)
                        }
                    }
                }
                
                Image("regular_\(business.rating ?? 0)")
                
                Divider()
                
                HStack {
                    Text("Phone: ")
                        .bold()
                    Text(business.displayPhone ?? "")
                    Spacer()
                    Link("Call", destination: URL(string: "tel:\(business.phone ?? "")")!)
                        .accentColor(.blue)
                }
                Divider()
                
                HStack {
                    Text("Reviews: ")
                        .bold()
                    Text("\(business.reviewCount ?? 0)")
                    Spacer()
                    Link("Read", destination: URL(string: "\(business.url ?? "")")!)
                        .accentColor(.blue)
                }
                Divider()
                
                HStack {
                    Text("Website: ")
                        .bold()
                    Text(business.url ?? "")
                    Spacer()
                    Link("Visit", destination: URL(string: "\(business.url ?? "")")!)
                        .accentColor(.blue)
                }
                Divider()
            }
            .padding()
            
            Button(action: {
                // Show Directions
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
        }
    }
}
