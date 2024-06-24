//
//  ContentView.swift
//  SimpleCalc
//
//  Created by Thorsten Hindermann on 21.06.24.
//

import SwiftUI

struct ContentView: View {
    @State private var result : String = "0"
    @State private var number1 : Double = 0
    @State private var number2 : Double = 0
    @State private var mathOperation : MathOp = .unknown
    @State private var errorState : Bool = false
    enum MathOp {
        case plus, minus, multiplication, division, unknown
    }
    var body: some View {
        VStack {
            Text(result)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.trailing)
                .lineLimit(1)
                .padding(.all)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                .accessibilityLabel(result)
                .accessibilityHint(result)
                .help(String(result))
                .onTapGesture(count: 2, perform: {
                    result = "0"
                    number1 = 0
                    number2 = 0
                    mathOperation = MathOp.unknown
                    errorState = false
                    
                })
                .foregroundColor(errorState ? .red : .black)
                .background(.gray)
//                .onKeyPress(characters: <#T##CharacterSet#>, action: <#T##(KeyPress) -> KeyPress.Result#>)
            
            HStack {
                Button("7", action: {buttonPressed(number:"7")})
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .accessibilityLabel("7")
                    .accessibilityHint("7")
                    .help("7")
                Spacer()
                Button("8", action: {buttonPressed(number:"8")})
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .accessibilityLabel("8")
                    .accessibilityHint("8")
                    .help("8")

                Spacer()
                Button("9", action: {buttonPressed(number:"9")})
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .accessibilityLabel("9")
                    .accessibilityHint("9")
                    .help("9")
                Spacer()
                Button("+", action: {mathOpPressed(mathop:.plus)})
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .tint(.orange)
                    .accessibilityLabel("plus")
                    .accessibilityHint("plus")
                    .help("plus")

            }.padding(.horizontal)
            
            HStack {
                Button("4", action: {buttonPressed(number:"4")})
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .accessibilityLabel("4")
                    .accessibilityHint("4")
                    .help("4")

                Spacer()
                Button("5", action: {buttonPressed(number:"5")})
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .accessibilityLabel("5")
                    .accessibilityHint("5")
                    .help("5")

                Spacer()
                Button("6", action: {buttonPressed(number:"6")})
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .accessibilityLabel("6")
                    .accessibilityHint("6")
                    .help("6")

                Spacer()
                Button("-", action: {mathOpPressed(mathop:.minus)})
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .tint(.orange)
                    .accessibilityLabel("minus")
                    .accessibilityHint("minus")
                    .help("minus")

                
            }.padding(.horizontal)
            
            HStack {
                Button("1", action: {buttonPressed(number:"1")})
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .accessibilityLabel("1")
                    .accessibilityHint("1")
                    .help("1")

                Spacer()
                Button("2", action: {buttonPressed(number:"2")})
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .accessibilityLabel("2")
                    .accessibilityHint("2")
                    .help("2")

                Spacer()
                Button("3", action: {buttonPressed(number:"3")})
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .accessibilityLabel("3")
                    .accessibilityHint("3")
                    .help("3")

                Spacer()
                Button("*", action: {mathOpPressed(mathop:.multiplication)})
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .tint(.orange)
                    .accessibilityLabel("muliplication")
                    .accessibilityHint("muliplication")
                    .help("muliplication")

                
            }.padding(.horizontal)
            
            HStack {
                Button("-", action: negatePressed)
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .tint(.purple)
                    .accessibilityLabel("negation")
                    .accessibilityHint("negation")
                    .help("negation")

                Spacer()
                Button("0", action: {buttonPressed(number:"0")})
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .accessibilityLabel("0")
                    .accessibilityHint("0")
                    .help("0")

                Spacer()
                Button("=", action: equalPressed)
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                    .accessibilityLabel("equals")
                    .accessibilityHint("equals")
                    .help("equals")

                Spacer()
                Button("/", action: {mathOpPressed(mathop:.division)})
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .tint(.orange)
                    .accessibilityLabel("divison")
                    .accessibilityHint("divison")
                    .help("divison")

                
            }
            .padding(/*@START_MENU_TOKEN@*/[.leading, .bottom, .trailing]/*@END_MENU_TOKEN@*/)
        }
        .padding(.all)
    }
    func buttonPressed(number : String) -> Void {
        if result == "0" {
            result = number
        } else {
            result += number
        }
    }
    func negatePressed() -> Void {result = String((Double(result) ?? 0) * -1)}
    func equalPressed() -> Void {
        number2 = Double(result) ?? 0
        switch mathOperation {
            case .plus:
            result = String(number1 + number2)
            case .minus:
                result = String(number1 - number2)
            case .multiplication:
                result = String(number1 * number2)
            case .division:
                if number2 == 0 {
                    result = "Divion by 0!"
                    errorState = true
                } else {
                    result = String(number1 / number2)
                }
            default:
                result = "Unkown error!"
                errorState = true
        }
    }
    func mathOpPressed(mathop: MathOp) -> Void {
        number1 = Double(result) ?? 0
        result = "0"
        switch mathop {
        case .plus:
            mathOperation = .plus
        case .minus:
            mathOperation = .minus
        case .multiplication:
            mathOperation = .multiplication
        case .division:
            mathOperation = .division
        default:
            mathOperation = .unknown
        }
    }
}

#Preview {
    ContentView()
}
