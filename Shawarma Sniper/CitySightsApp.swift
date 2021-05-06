//
//  CitySightsApp.swift
//  City Sights App
//
//  Created by Uthman Mohamed on 2021-05-04.
//

import SwiftUI

@main
struct CitySightsApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchViews()
                .environmentObject(ContentModel())
        }
    }
}
