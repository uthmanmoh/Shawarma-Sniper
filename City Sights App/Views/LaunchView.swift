//
//  LaunchViews.swift
//  City Sights App
//
//  Created by Uthman Mohamed on 2021-05-04.
//

import SwiftUI
import CoreLocation

struct LaunchViews: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        if model.authorizationState == .notDetermined {
            OnBoardingView()
        } else if model.authorizationState == .authorizedAlways ||
                    model.authorizationState == .authorizedWhenInUse {
            HomeView()
        } else  {
            LocationDeniedView()
        }
        
    }
}

struct LaunchViews_Previews: PreviewProvider {
    static var previews: some View {
        LaunchViews()
    }
}
