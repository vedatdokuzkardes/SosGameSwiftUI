//
//  SosGameTests.swift
//  SosGameTests
//
//  Created by Vedat Dokuzkardeş on 14.01.2024.
//

import XCTest
import Factory
import Combine

@testable import SosGame

final class OnlineGameTests: XCTestCase {
    
    private var cancellables: Set<AnyCancellable> = []
    
    func test_joinGameReturnsReadyGame() async throws {
        Container.setupMocs()

        let sut = OnlineGameRepository()
        
        sut.$game
            .dropFirst()
            .sink { newValue in
                XCTAssertEqual(newValue?.id, "MocID")
                XCTAssertEqual(newValue?.player1Id, "P1ID")
            }
            .store(in: &cancellables)
        
        await sut.joinGame()
    }
    
    func test_joinGameCreatesNewGame() async throws {
        
        Container.setupMocs(shouldReturnNil: true)
        
        let sut = OnlineGameRepository()
        
        sut.$game
            .dropFirst()
            .sink { newValue in
                XCTAssertEqual(newValue?.player2Id, "")
            }
            .store(in: &cancellables)
        
        await sut.joinGame()
    }
}
