//
//  CatorDogApp.swift
//  CatorDog
//
//  Created by Joanne Liu on 4/8/24.
//

import SwiftUI

@main
struct CatorDogApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(model: AnimalModel())
        }
    }
}
