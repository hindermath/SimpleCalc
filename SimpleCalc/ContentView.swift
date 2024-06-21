//
//  ContentView.swift
//  SimpleCalc
//
//  Created by Thorsten Hindermann on 21.06.24.
//

import SwiftUI

struct ContentView: View {
    @State private var result : String = "0"
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(result)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                Spacer()
            }
            .padding()
            
            Spacer()
            
            HStack {
                Button("7", action: buttonPressed)
                    .padding()
                    .buttonStyle(.borderedProminent)
                Spacer()
                Button("8", action: buttonPressed)
                    .padding()
                .buttonStyle(.borderedProminent)
                Spacer()
                Button("9", action: buttonPressed)
                    .padding()
                .buttonStyle(.borderedProminent)
                Spacer()
                Button("+", action: mathOpPressed)
                    .padding()
                .buttonStyle(.borderedProminent)
            }
            .padding()
            HStack {
                Button("4", action: buttonPressed)
                    .padding()
                    .buttonStyle(.borderedProminent)
                Spacer()
                Button("5", action: buttonPressed)
                    .padding()
                    .buttonStyle(.borderedProminent)
                Spacer()
                Button("6", action: buttonPressed)
                    .padding()
                    .buttonStyle(.borderedProminent)
                Spacer()
                Button("-", action: mathOpPressed)
                    .padding()
                    .buttonStyle(.borderedProminent)
                
            }
            .padding()
            HStack {
                Button("1", action: buttonPressed)
                    .padding()
                    .buttonStyle(.borderedProminent)
                Spacer()
                Button("2", action: buttonPressed)
                    .padding()
                    .buttonStyle(.borderedProminent)
                Spacer()
                Button("3", action: buttonPressed)
                    .padding()
                    .buttonStyle(.borderedProminent)
                Spacer()
                Button("*", action: mathOpPressed)
                    .padding()
                    .buttonStyle(.borderedProminent)
                
            }
            .padding()
            HStack {
                Button("-", action: negatePressed)
                    .padding()
                    .buttonStyle(.borderedProminent)
                Spacer()
                Button("0", action: buttonPressed)
                    .padding()
                    .buttonStyle(.borderedProminent)
                Spacer()
                Button("=", action: equalPressed)
                    .padding()
                    .buttonStyle(.borderedProminent)
                Spacer()
                Button("/", action: mathOpPressed)
                    .padding()
                    .buttonStyle(.borderedProminent)
                
            }
            .padding()
        }
    }
    func buttonPressed() -> Void {}
    func negatePressed() -> Void {}
    func equalPressed() -> Void {}
    func mathOpPressed() -> Void {}}

#Preview {
    ContentView()
}
