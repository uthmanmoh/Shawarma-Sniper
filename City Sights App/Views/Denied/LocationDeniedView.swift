//
//  LocationDeniedView.swift
//  City Sights App
//
//  Created by Uthman Mohamed on 2021-05-05.
//

import SwiftUI

struct LocationDeniedView: View {
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text("Whoops")
                    .font(.title)
                Text("We need to access your location to provide you with the best shawarma locations near you! You can change your decision anytime in Settings.")
                    .multilineTextAlignment(.center)
            }
            Spacer()
            Button(action: {
                // Open Settings
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
            })
            {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 48)
                        .foregroundColor(Color(.label))
                        .colorInvert()
                        .shadow(color: Color(.label), radius: 2)
                    
                    Text("Go to Settings")
                        .foregroundColor(Color(.label))
                        .font(.headline)
                }
                .padding()
            }
            .padding([.bottom], 70)
            Spacer()
        }
        .background(Color.gray)
        .ignoresSafeArea()
    }
}

struct LocationDeniedView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDeniedView()
    }
}
