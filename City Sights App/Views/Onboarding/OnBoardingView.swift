//
//  OnBoardingView.swift
//  City Sights App
//
//  Created by Uthman Mohamed on 2021-05-04.
//

import SwiftUI

struct OnBoardingView: View {
    
    @EnvironmentObject var model: ContentModel
    @State private var tabSelected = 0
    
    private let lightOrange = Color(red: 255/255, green: 163/255, blue: 0/255)
    private let darkOrange = Color(red: 255/255, green: 100/255, blue: 0/255)
    
    var body: some View {
        VStack {
                
                TabView (selection: $tabSelected) {
                    VStack(alignment: .center, spacing: 20) {
                        Spacer()
                        Image("shawarma")
                            .resizable()
                            .scaledToFit()
                        
                        Spacer()
                        
                        VStack {
                            Text("Welcome to")
                                .bold()
                                .font(.title)
                            Text("Shawarma Sniper")
                                .bold()
                                .font(.largeTitle)
                        }
                        .padding(.horizontal, 15)
                        
                        Text("Shawarma Sniper helps you find the best Shawarma near you!")
                            .padding(.horizontal, 15)
                        Spacer()
                    }
                    .tag(0)
                    
                    VStack (alignment: .center) {
                        Spacer()
                        Image("sumaq")
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                        Spacer()
                        Text("Ready to find the BEST Shawarma?")
                            .bold()
                            .font(.title)
                            .padding(.horizontal, 15)
                        Text("We'll show you the greatest Shawarma places near your location!")
                            .padding(.horizontal, 15)
                        Spacer()
                    }
                    .tag(1)
                    
                }
                .multilineTextAlignment(.center)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                
                
                Button(action: {
                    if tabSelected == 0 {
                        tabSelected = 1
                    } else {
                        model.requestGeolocationPermission()
                    }
                })
                {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 48)
                            .foregroundColor(Color(.label))
                            .colorInvert()
                            .shadow(color: Color(.label), radius: 2)
                        
                        Text(tabSelected == 0 ? "Next" : "Get My Location")
                            .foregroundColor(Color(.label))
                            .font(.headline)
                    }
                    .padding()
                }
                .padding([.bottom], 70)
            }
            .background(tabSelected == 0 ? lightOrange : darkOrange)
        .ignoresSafeArea()
        
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
