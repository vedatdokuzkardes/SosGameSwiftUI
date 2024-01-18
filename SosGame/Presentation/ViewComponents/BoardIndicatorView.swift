//
//  BoardIndicatorView.swift
//  TicTacToeGame
//
//  Created by Vedat Dokuzkardeş on 13.01.2024.
//

import SwiftUI

struct BoardIndicatorView: View {
    
    var imageName: String
    @State private var scale = 1.5
    
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .frame(width: 60, height: 60)
            .scaledToFit()
            .foregroundColor(.black)
            .scaleEffect(scale)
            .animation(.spring(), value: scale)
            .shadow(radius: 5)
            .onChange(of: imageName) { oldValue, newValue in
                self.scale = 2.5
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.scale =  1.5
                }
            }
    }
}

#Preview {
    BoardIndicatorView(imageName: "applelogo")
}

