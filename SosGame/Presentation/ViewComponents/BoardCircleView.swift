//
//  BoardCircleView.swift
//  TicTacToeGame
//
//  Created by Vedat Dokuzkardeş on 13.01.2024.
//

import SwiftUI

struct BoardCircleView: View {
    
    var geometry: GeometryProxy
    
    @State var sizeDivider: CGFloat = 3
    @State var padding: CGFloat = 15
    
    var body: some View {
        Circle()
            .fill(.blue)
            .frame(width: geometry.size.width / sizeDivider - padding,
                   height: geometry.size.width / sizeDivider - padding)
            .onAppear {
                if UIDevice.current.userInterfaceIdiom == .pad {
                    sizeDivider = 4
                }
            }
    }
}

#Preview {
    GeometryReader{ geometry in
        BoardCircleView(geometry: geometry)
    }
}
