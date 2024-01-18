//
//  ContentView.swift
//  TicTacToeGame
//
//  Created by Vedat Dokuzkardeş on 12.01.2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var gameMode: GameMode?
    
    @ViewBuilder
    private func titleView() -> some View {
        VStack(spacing: 20) {
            Image(systemName: "s.circle")
                .renderingMode(.original)
                .resizable()
                .frame(width: 180, height: 180)
            
            Text(AppStrings.appName)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .foregroundColor(.yellow)
        .padding(.top, 50)
    }
    
    @ViewBuilder
    private func buttonView() -> some View {
        VStack(spacing: 15){
            ForEach(GameMode.allCases, id: \.self) { mode in
                Button{
                    self.gameMode = mode
                }label: {
                    Text(mode.name)
                }
                .buttonStyle(.appButton(color: mode.color))
            }
            
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 50)
    }
    
    @ViewBuilder
    private func main() -> some View {
        VStack{
            titleView()
            Spacer()
            buttonView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
    
    var body: some View {
        main()
            .fullScreenCover(item: $gameMode) { gameMode in
                GameView(viewModel: GameViewModel(with: gameMode, onlineGameRepository: OnlineGameRepository()))
            }
    }
}

#Preview {
    HomeView()
}
