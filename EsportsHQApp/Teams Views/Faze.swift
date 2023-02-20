//
//  Faze.swift
//  EsportsHQ
//
//  Created by Nicholas Ruggles on 2/6/23.
//

import SwiftUI

struct Faze: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
      
            ZStack{
                
                Color("DarkBG")
                    .ignoresSafeArea()
                Button {
                    dismiss()
                } label: {
                    Text("Back")
                }
               // MatchHistoryView()
                    .frame(width:400)

                
 
        }
    }
}

struct Faze_Previews: PreviewProvider {
    static var previews: some View {
        Faze()
    }
}
