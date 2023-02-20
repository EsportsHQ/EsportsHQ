//
//  CustomTabBar.swift
//  EsportsHQ
//
//  Created by Nicholas Ruggles on 1/25/23.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var currentTab: Tab
  
 
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(height: 24)
                .padding(.bottom, 30)
                .shadow(color: Color("EBlue"), radius: 10, x: 0, y: -2)
            
            VStack {
                HStack(spacing: 0.0){
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        Button{
                            withAnimation(.easeInOut) {
                                currentTab = tab
                            }
                        }
                        
                    label: {
                        HStack{
                            Spacer()
                            VStack{
                                
                                Image(tab.rawValue)
                                    .font(.system(size: 20))
                                    .foregroundColor(currentTab == tab ? Color("EBlue") : .white)
                                    .offset(y: currentTab == tab ? -10 : 0)
                                Text(tab.rawValue)
                                    .font(.system(size: 9))
                                    .foregroundColor(currentTab == tab ? Color("EBlue") : .white)
                                    .padding(.top, 5.0)
                                    .offset(y: currentTab == tab ? -10 : 0)
                                
                                
                            }
                            
                            
                            Spacer()
                        }
                        
                        
                    }
                        
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .background(alignment: .leading) {
                    
                }
                
            }
            .frame(height: 24)
            .padding(.top, 30)
            .background(Color("darktab"))
            
            
            
            
            
            
        }
    }
    
    struct CustomTabBar_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
