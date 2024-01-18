//
//  GameMove.swift
//  TicTacToeGame
//
//  Created by Vedat Dokuzkardeş on 13.01.2024.
//

import Foundation

struct GameMove: Codable {
    let player: Player
    let boardIndex: Int
    
    var indicator: String {
        player == .player1 ? "s.circle.fill" : "o.circle.fill"
    }
}
