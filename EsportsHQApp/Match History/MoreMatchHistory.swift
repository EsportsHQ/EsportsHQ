//
//  MoreMatchHistory.swift
//  EsportsHQApp
//
//  Created by Nicholas Ruggles on 2/9/23.
//

import SwiftUI

struct MoreMatchHistory: View {

    
    @Environment(\.dismiss) var dismiss
    var body: some View {
   
            
            Button {
                dismiss()
            } label: {
                ZStack{
                    
                    HStack{
                        
                        Color("DarkBG")
                            .cornerRadius(5)
                    }
                    HStack{
                        Image(systemName: "arrowshape.backward.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                        Text("BACK")
                            .fontWeight(.bold)
                        
                            .foregroundColor(.white)
                            .padding(.trailing,5)
                        
                    }
                    
                }
            }
            .frame(width: 100,height: 50)
            
        }
        
    
    
    struct MoreMatchHistory_Previews: PreviewProvider {
        static var previews: some View {
            MoreMatchHistory()
                .previewLayout(.sizeThatFits)
               
        }
    }
}

