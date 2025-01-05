//
//  ViewModifiers.swift
//  SimpleBankApp
//
//  Created by Sergey on 01.01.2025.
//

import SwiftUI

// MARK: RoundedBlue

@available(iOS 15.0, *)
public struct RoundedBlue: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(.title3)
            .foregroundStyle(.white)
            .padding(10)
            .background(.blue)
            .clipShape(Rectangle())
            .cornerRadius(10)
    }
}

@available(iOS 15.0, *)
public extension View {
    func roundedBlueStyle() -> some View {
        modifier(RoundedBlue())
    }
}


// MARK: CardNumbered

@available(iOS 15.0, *)
public struct CardNumber: ViewModifier {
    var text: String

    public func body(content: Content) -> some View {
        ZStack(alignment: .bottom) {
            content
            Text(text)
                .font(.title3)
                .foregroundStyle(.black)
                .padding(.bottom, 30)
        }
    }
}

@available(iOS 15.0, *)
public extension View {
    func cardNumbered(with text: String) -> some View {
        modifier(CardNumber(text: text))
    }
}
