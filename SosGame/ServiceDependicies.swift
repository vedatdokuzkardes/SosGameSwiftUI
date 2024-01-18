//
//  ServiceDependicies.swift
//  SosGame
//
//  Created by Vedat Dokuzkardeş on 15.01.2024.
//

import Foundation
import Factory

extension Container{
    
    var firebaseRepository: Factory<FirebaseRepositoryProtocol>{
        self {FirebaseRepository()}
            .shared
    }
}
