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
    enum MathOp {
        case plus, minus, multiplication, division, unknown
    }
    var body: some View {
        VStack {
            HStack {
                Text(result)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
            }
            
            HStack {
                Button("7", action: {buttonPressed(number:"7")})
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .id(7)
                Spacer()
                Button("8", action: {buttonPressed(number:"8")})
                    .padding()
                    .buttonStyle(.borderedProminent)
                Spacer()
                Button("9", action: {buttonPressed(number:"9")})
                    .padding()
                    .buttonStyle(.borderedProminent)
                Spacer()
                Button("+", action: {mathOpPressed(mathop:.plus)})
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .tint(.orange)
            }
            
            HStack {
                Button("4", action: {buttonPressed(number:"4")})
                    .padding()
                    .buttonStyle(.borderedProminent)
                Spacer()
                Button("5", action: {buttonPressed(number:"5")})
                    .padding()
                    .buttonStyle(.borderedProminent)
                Spacer()
                Button("6", action: {buttonPressed(number:"6")})
                    .padding()
                    .buttonStyle(.borderedProminent)
                Spacer()
                Button("-", action: {mathOpPressed(mathop:.minus)})
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .tint(.orange)
                
            }
            
            HStack {
                Button("1", action: {buttonPressed(number:"1")})
                    .padding()
                    .buttonStyle(.borderedProminent)
                Spacer()
                Button("2", action: {buttonPressed(number:"2")})
                    .padding()
                    .buttonStyle(.borderedProminent)
                Spacer()
                Button("3", action: {buttonPressed(number:"3")})
                    .padding()
                    .buttonStyle(.borderedProminent)
                Spacer()
                Button("*", action: {mathOpPressed(mathop:.multiplication)})
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .tint(.orange)
                
            }
            
            HStack {
                Button("-", action: negatePressed)
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .tint(.purple)
                Spacer()
                Button("0", action: {buttonPressed(number:"0")})
                    .padding()
                    .buttonStyle(.borderedProminent)
                Spacer()
                Button("=", action: equalPressed)
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                Spacer()
                Button("/", action: {mathOpPressed(mathop:.division)})
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .tint(.orange)
                
            }
        }
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
                let errorString = "Divion by 0!"
                let attributedString = NSMutableAttributedString(string: errorString)
                attributedString.addAttribute(.foregroundColor, value: Color.red, range: NSRange(location: 0, length: attributedString.length))
                result = attributedString.string
            } else {
                result = String(number1 / number2)
            }
            default:
            let errorString = "Unkown Error!"
            let attributedString = NSMutableAttributedString(string: errorString)
            attributedString.addAttribute(.foregroundColor, value: Color.red, range: NSRange(location: 0, length: attributedString.length))
            result = attributedString.string
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
