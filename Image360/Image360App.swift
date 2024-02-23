//
//  Image360App.swift
//  Image360
//
//  Created by Mohd Hafiz on 23/02/2024.
//

import SwiftUI

@main
struct Image360App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
