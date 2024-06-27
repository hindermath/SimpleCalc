//
//  SettingsView.swift
//  SimpleCalc
//
//  Created by Thorsten Hindermann on 27.06.24.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("slider_seconds_to_wait") private var seconds_to_wait = 2.0
    
    var body: some View {
        NavigationView {
            Form {
                Slider(value: $seconds_to_wait, in: 1...5, step: 1) {
                    Text("Seconds to wait")
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
