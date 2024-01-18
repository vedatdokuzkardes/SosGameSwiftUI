//
//  OnlineGameRepository.swift
//  SosGame
//
//  Created by Vedat Dokuzkardeş on 15.01.2024.
//

import Foundation
import Combine
import Factory


let localPlayerId = UUID().uuidString

final class OnlineGameRepository: ObservableObject {
    
    @Injected(\.firebaseRepository) private var firebaseRepository
    
    @Published var game: Game!
    
    private var cancellables: Set<AnyCancellable> = []
    
    @MainActor
    func joinGame() async{
        
        if let gamesToJoin: Game = await getGame() {
            self.game = gamesToJoin
            self.game.player2Id = localPlayerId
            self.game.activePlayerId = self.game.player1Id
            
            await updateGame(self.game)
            await listenForChanges(in: self.game.id)
        }else {
            await createNewGame()
            await listenForChanges(in: self.game.id)
        }
    }
    
    @MainActor
    private func createNewGame() async {
        self.game = Game(id: UUID().uuidString,
                         player1Id: localPlayerId,
                         player2Id: "",
                         player1Score: 0,
                         player2Score: 0,
                         activePlayerId: localPlayerId,
                         winningPlayerId: "",
                         moves: Array(repeating: nil, count: 9))
        
       await self.updateGame(self.game)
    }
    
    @MainActor
    private func listenForChanges(in gameId: String) async{
        do {
            try await firebaseRepository.listen(from: .Game, documentId: gameId).sink(receiveCompletion: { completion in
                
                switch completion{
                case .finished:
                    return
                case .failure(let error):
                    print("Error", error.localizedDescription)
                }
                
            }, receiveValue: { [weak self] game in
                self?.game = game
            })
            .store(in: &cancellables)
            
            
        }catch{
            print("Error listening", error.localizedDescription)
        }
    }
    
    private func getGame() async -> Game? {
        return try? await firebaseRepository.getDocuments(from: .Game, for: localPlayerId)?.first
    }
    
    func updateGame(_ game: Game) async {
        
        do {
            try firebaseRepository.saveDocument(data: game, to: .Game)

        }catch{
            print("Error updating online game", error.localizedDescription)
        }
        
    }
    
    func quitGame() {
        guard game != nil else { return }
        //access firebase and delete game
        firebaseRepository.deleteDocument(with: self.game.id, from: .Game)
    }
}
