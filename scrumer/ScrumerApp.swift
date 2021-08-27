//
//  ScrumerApp.swift
//  scrumer
//
//  Created by Saba Khutsishvili on 24.08.21.
//

import SwiftUI

@main
struct ScrumerApp: App {
    
    @ObservedObject private var data = ScrumData()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $data.scrums)
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .onAppear {
                data.load()
            }
        }
    }
}
