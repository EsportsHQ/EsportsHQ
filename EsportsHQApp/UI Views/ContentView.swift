//
//  ContentView.swift
//  EsportsHQ
//
//  Created by Nicholas Ruggles on 1/25/23.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab: Tab = .home
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
       
        
        VStack(spacing: 0.0) {
           
            TabView(selection: $currentTab){
               
                TeamView()
                    .tag(Tab.teams)
                Text("Schedule")
                    .tag(Tab.schedule)
                HomeView()
                    .tag(Tab.home)
               MatchHistoryView()
                    .tag(Tab.matchhistory)
                Text("Search")
                    .tag(Tab.search)
              
                                    
                
            }
            CustomTabBar(currentTab: $currentTab)
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
