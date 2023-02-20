//
//  MatchHistoryScreen.swift
//  EsportsHQ
//
//  Created by Nicholas Ruggles on 2/8/23.
//

import SwiftUI

struct MatchHistoryScreen: View {
    var gradient = Gradient(colors: [Color("Button1"), Color("Button2")])
    @ObservedObject private var viewModel = MatchHistory()
    var body: some View {
        NavigationView{
            
            ScrollView{
                
                LazyVStack(spacing: 30){
                    Text("MATCH HISTORY")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                    
                        .padding(.trailing, 130.0)
                    ForEach(viewModel.History) { Matches in
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 8)
                                .fill(RadialGradient(gradient: gradient, center: .center, startRadius: 5, endRadius: 180))
                                .shadow(color: .white, radius: 5
                                )
                                .frame(height: 150)
                            VStack{
                                HStack{
                                    Text("Major 2 Qualifiers")
                                        .font(.headline)
                                        .foregroundColor(.yellow)
                                    
                                    
                                    Spacer()
                                }
                                .padding(.leading)
                                
                                HStack{
                                    Text(Matches.Team1)
                                        .multilineTextAlignment(.center)
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.white)
                                    Image(Matches.Team1)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 40)
                                    Text(Matches.Team1Score)
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.white)
                                    Text("-")
                                        .font(.title)
                                        .foregroundColor(.yellow)
                                    Text(Matches.Team2Score)
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.white)
                                    Image(Matches.Team2)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 40)
                                    Text(Matches.Team2)
                                        .multilineTextAlignment(.center)
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.white)
                                }
                                .padding(.horizontal, 25.0)
                                HStack{
                                    Spacer()
                                    Text("\(Matches.TimeStamp.formatted(.dateTime.month().day().year()))")
                                        .fontWeight(.medium)
                                        .foregroundColor(Color.white)
                                    Text("●")
                                        .font(.caption)
                                        .foregroundColor(.yellow)
                                    Text("\(Matches.TimeStamp.formatted(.dateTime.hour().minute()))")
                                        .fontWeight(.medium)
                                        .foregroundColor(Color.white)
                                    Spacer()
                                    
                                }.padding(.top, 5.0)
                                
                            }
                        }
                        .padding(.horizontal, 10)
                        
                    }
                }
                .mask(LinearGradient(gradient: Gradient(stops: [
                            .init(color: .black, location: 0),
                            .init(color: .clear, location: 1),
                            .init(color: .black, location: 1),
                            .init(color: .clear, location: 1)
                        ]), startPoint: .top, endPoint: .bottom))
                .padding(.top, 30)
                
                
            }
            
            //.offset(y:70)
            .background(Color("DarkBG").opacity(1))
            
        }
        
        .ignoresSafeArea(.all)
        
        
    }
    
    struct MatchHistoryScreen_Previews: PreviewProvider {
        static var previews: some View {
            MatchHistoryScreen()
        }
    }
}
