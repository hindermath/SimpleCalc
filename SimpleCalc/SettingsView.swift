//
//  SettingsView.swift
//  SimpleCalc
//
//  Created by Thorsten Hindermann on 27.06.24.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("slider_seconds_to_wait") private var seconds_to_wait = 2.0
    @AppStorage("toggle_switch_enable_slider") private var enable_slider : Bool = false
    
    var body: some View {
        NavigationStack {
            
            Form {
                Section(header: Text("General")
                    .padding(.all)
                    .font(.largeTitle)
                ) {
                    Text("Seconds to wait")
                        .font(.title)
                        .accessibilityLabel("Seconds to wait")
                        .accessibilityHint("Seconds to wait")
                        .help("Seconds to wait")
                    Toggle("Enable", isOn: $enable_slider)
                        .font(.largeTitle)
                    Slider(value: $seconds_to_wait, in: 1...5, step: 1) {}
                        .accessibilityLabel("Horizontal Slider")
                        .accessibilityHint("Horizontal Slider")
                        .help("Horizontal Slider")
                        .disabled(enable_slider ? false : true)
                }
                .padding(.all)
                .accessibilityLabel("General")
                .accessibilityHint("General")
                .help("General")
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .navigationTitle("Settings")
            .accessibilityLabel("Settings")
            .accessibilityHint("Settings")
            .help("Settings")
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        Spacer()
    }
}

#Preview {
    SettingsView()
}
