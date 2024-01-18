//
//  SosGameTests.swift
//  SosGameTests
//
//  Created by Vedat Dokuzkardeş on 14.01.2024.
//

import Foundation
import Factory

@testable import SosGame

extension Container {
    static func setupMocs(shouldReturnNil: Bool = false) {
        Container.shared.firebaseRepository.register {
            MocFirebaseRepository(shouldReturnNil: shouldReturnNil)
        }
    }
}
