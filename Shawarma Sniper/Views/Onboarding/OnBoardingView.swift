//
//  OnBoardingView.swift
//  Shawarma Sniper
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
                        
                        VStack  {
                            Text("Welcome to")
                                .font(Font.custom("Avenir Heavy", size: 35))
                                .padding(.bottom, -15)
                            Text("Shawarma Sniper")
                                .font(Font.custom("Avenir Heavy", size: 40))
                        }
                        .padding(.horizontal, 15)
                        
                        Text("Shawarma Sniper helps you find the best Shawarma near you!")
                            .font(Font.custom("Avenir", size: 17))
                            .padding([.horizontal, .bottom], 15)
                            .padding(.bottom)
                        Spacer()
                    }
                    .tag(0)
                    
                    VStack (alignment: .center, spacing: 20) {
                        Spacer()
                        Image("sumaq")
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                        Spacer()
                        Text("Ready to find the BEST Shawarma?")
                            .font(Font.custom("Avenir Heavy", size: 30))
                            .padding(.horizontal, 15)
                        Text("We'll show you the greatest Shawarma places near your location!")
                            .font(Font.custom("Avenir", size: 17))
                            .padding([.horizontal, .bottom], 15)
                            .padding(.bottom)
                        Spacer()
                    }
                    .tag(1)
                    
                }
                .foregroundColor(.black)
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
                            .shadow(color: tabSelected == 1 ? .black : lightOrange, radius: 5, x: -2, y: 5)
                            .foregroundColor(Color(.brown))
                        
                        Text(tabSelected == 0 ? "Next" : "Get My Location")
                            .font(Font.custom("Avenir Heavy", size: 18))
                            .foregroundColor(.black)
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
        OnBoardingView().colorScheme(.dark)
    }
}
