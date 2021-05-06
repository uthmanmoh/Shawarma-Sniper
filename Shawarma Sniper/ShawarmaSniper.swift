//
//  ShawarmaSniper.swift
//  Shawarma Sniper
//
//  Created by Uthman Mohamed on 2021-05-04.
//

import SwiftUI

@main
struct ShawarmaSniper: App {
    var body: some Scene {
        WindowGroup {
            LaunchViews()
                .environmentObject(ContentModel())
        }
    }
}
