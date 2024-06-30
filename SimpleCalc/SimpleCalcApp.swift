//
//  SimpleCalcApp.swift
//  SimpleCalc
//
//  Created by Thorsten Hindermann on 21.06.24.
//

import SwiftUI

@main
struct SimpleCalcApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // Create the typical settings page of macOS apps
        #if os(macOS)
        Settings {
            SettingsView()
        }
        #endif
    }
}
