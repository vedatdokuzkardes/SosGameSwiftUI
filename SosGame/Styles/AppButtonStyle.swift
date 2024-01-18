//
//  AppButtonStyle.swift
//  TicTacToeGame
//
//  Created by Vedat Dokuzkardeş on 12.01.2024.
//

import SwiftUI

struct AppButtonStyle: ButtonStyle {
    
    let color: Color
    
    init(color: Color) {
        self.color = color
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .font(.title2)
            .fontWeight(.semibold)
            .padding()
            .background(color)
            .foregroundColor(.black)
            .clipShape(Capsule())
            .opacity(configuration.isPressed ? 0.5 : 1.0)
            .shadow(radius: 8)
    }
}

extension ButtonStyle where Self == AppButtonStyle {
    static func appButton(color:  Color) -> AppButtonStyle{
        AppButtonStyle(color: color)
    }
}

