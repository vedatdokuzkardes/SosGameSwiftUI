//
//  SosGameApp.swift
//  SosGame
//
//  Created by Vedat Dokuzkardeş on 14.01.2024.
//

import SwiftUI
import Firebase

@main
struct SosGameApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
