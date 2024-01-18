//
//  FCollectionReference.swift
//  SosGame
//
//  Created by Vedat Dokuzkardeş on 14.01.2024.
//

import Foundation
import Firebase

enum FCollectionReference: String {
    case Game
}

func firebaseReference(_ reference: FCollectionReference) -> CollectionReference {
    Firestore.firestore().collection(reference.rawValue)
}
