//
//  EsportsHQAppApp.swift
//  EsportsHQApp
//
//  Created by Nicholas Ruggles on 2/9/23.
//

import SwiftUI
import Firebase

@main
struct EsportsHQAppApp: App {
    
    init(){
        FirebaseApp.configure()
    }


  var body: some Scene {
    WindowGroup {
      NavigationView {
        ContentView()
      }
    }
  }
}
