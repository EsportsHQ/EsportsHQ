//
//  HomeView.swift
//  EsportsHQ
//
//  Created by Nicholas Ruggles on 1/25/23.
//

import SwiftUI
import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


class LiveMatch: ObservableObject {
    @Published private(set) var Live: [Matches] = []
    
    let db = Firestore.firestore()
   
    init(){
        getMatches()
    }
    
    func getMatches() {
        db.collection("Matches").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else{
                print("Error fetching documents: \(String(describing: error))")
                return
            }
            
            self.Live = documents.compactMap { document -> Matches? in
                do{
                    return try document.data(as:Matches.self)
                } catch {
                    print("ERROR \(error)")
                    return nil
                }
               
            }
            self.Live = self.Live.filter {$0.IsLive}
           
            }
            
            }
        }
  


struct HomeView: View {
    @ObservedObject private var viewModel = LiveMatch()
    var gradient = Gradient(colors: [Color("Button1"), Color("Button2")])
    @State var ispressed: Matches? = nil
    var body: some View {
   
    
        ZStack{
            Color("DarkBG")
                .ignoresSafeArea()
            
            
            VStack{
                Text("Live Matches")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
               
                
                ZStack{
                    Text("THERE ARE NO CURRENT MATCHES")
                        .multilineTextAlignment(.center)
                        .padding(.top)
                        .padding(.horizontal, 30)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    ForEach(viewModel.Live) { Matches in
                        
                        Button {
                            ispressed = Matches
                       
                            
                        } label: {
                            ZStack{
                                Text("THERE ARE NO CURRENT MATCHES")
                                Image(Matches.CurrentMap)
                                    .resizable()
                                
                                    .frame(height: 125)
                                VStack{
                                    
                                    HStack{
                                        
                                        Image(Matches.Team1)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 80)
                                            .shadow(color: .black, radius: 5, x: 5, y: 5)
                                        Text("VS")
                                            .fontWeight(.bold)
                                            .font(.title)
                                            .foregroundColor(.white)
                                        
                                        Image(Matches.Team2)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 80)
                                            .shadow(color: .black, radius: 5, x: 5, y: 5)
                                    }
                                    
                                    VStack{
                                        
                                        HStack{
                                            Text(Matches.Team1Score)
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                            
                                            Text("-")
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                            Text(Matches.Team2Score)
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                        }
                                       
                                        
                                        VStack{
                                            
                                            Text(Matches.CurrentMode)
                                                .textCase(.uppercase)
                                                .font(.title3)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                                .shadow(color: .black, radius: 5, x: 5, y: 5)
                                            
                                            
                                            Text(Matches.CurrentMap)
                                                .textCase(.uppercase)
                                                .font(.subheadline)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                                .padding(.top,-15)
                                                .shadow(color: .black, radius: 5, x: 5, y: 5)
                                            
                                            
                                        }
                                        
                                        
                                        
                                    }
                                    .padding(.bottom, 10)

                                    
                                    
                                }.padding(.top, 30.0)
                                    .padding(.bottom)
                                
                            }
                            .padding(.horizontal, 10)
                            .frame(width: .infinity, height: 125)
                        }
                        
                        
                    }
                   
                    .fullScreenCover(item: $ispressed) { Matches in
                        
                        
                        ZStack{
                            Color("DarkBG")
                                .ignoresSafeArea()
                            ScrollView{
                                VStack{
                                    MoreMatchHistory()
                                        .padding(.trailing, 250)
                                    
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(RadialGradient(gradient: gradient, center: .center, startRadius: 5, endRadius: 180))
                                            .shadow(color: .white, radius: 2)
                                        
                                        HStack{
                                            
                                            Image(Matches.Team1)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 50)
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
                                                .frame(width: 50)
                                            
                                        }
                                        
                                        
                                    }
                                    .frame(width: 200,height: 60)
                                    .padding(.leading, 130)
                                    .padding(.bottom, 10)
                                    LiveView(videoID: "\(Matches.MatchURL)&parent=twitch.tv")
                                        .frame(width: 380 ,height: 213.75)
                                        .aspectRatio(contentMode: .fit)
                                        .padding(.horizontal, 20)
                                    
                                    VStack{
                                        ZStack{
                                            Image(Matches.Match1Map)
                                                .resizable()
                                                .aspectRatio( contentMode: .fit)
                                                .padding(.top, 40)
                                                .padding(.horizontal, 40)
                                            HStack{
                                                VStack{
                                                    Image(Matches.Team1)
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 50)
                                                        .shadow(color: .black, radius: 5, x: 5, y: 5)
                                                    Text(Matches.Team1Match1Score)
                                                        .font(.title)
                                                    
                                                        .fontWeight(.bold)
                                                        .foregroundColor(.white)
                                                        .padding(.top,-5)
                                                }
                                                .padding(.trailing, 38)
                                                .padding(.top, 45)
                                                VStack{
                                                    Text ("HARDPOINT")
                                                        .font(.title3)
                                                        .fontWeight(.bold)
                                                        .foregroundColor(.white)
                                                    
                                                    
                                                    Text(Matches.Match1Map)
                                                        .textCase(.uppercase)
                                                        .font(.subheadline)
                                                        .fontWeight(.bold)
                                                        .foregroundColor(.white)
                                                        .padding(.top,-15)
                                                    
                                                }
                                                .padding(.top, 65)
                                                VStack{
                                                    Image(Matches.Team2)
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 50)
                                                        .shadow(color: .black, radius: 5, x: 5, y: 5)
                                                    Text(Matches.Team2Match1Score)
                                                        .font(.title)
                                                    
                                                        .fontWeight(.bold)
                                                        .foregroundColor(.white)
                                                        .padding(.top,-5)
                                                }
                                                .padding(.leading, 38)
                                                .padding(.top, 45)
                                                
                                            }
                                        }
                                        ZStack{
                                            Image(Matches.Match2Map)
                                                .resizable()
                                                .aspectRatio( contentMode: .fit)
                                                .padding(.top, 40)
                                                .padding(.horizontal, 40)
                                            HStack{
                                                
                                                VStack{
                                                    Image(Matches.Team1)
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 50)
                                                    
                                                    Text(Matches.Team1Match2Score)
                                                        .font(.title)
                                                    
                                                        .fontWeight(.bold)
                                                        .foregroundColor(.white)
                                                        .padding(.top,-5)
                                                }
                                                .padding(.leading, 20)
                                                .padding(.top, 45)
                                                
                                                
                                                VStack{
                                                    Text ("Search & Destroy")
                                                        .textCase(.uppercase)
                                                        .font(.title3)
                                                        .fontWeight(.bold)
                                                        .foregroundColor(.white)
                                                    
                                                    
                                                    Text(Matches.Match2Map)
                                                        .textCase(.uppercase)
                                                        .font(.subheadline)
                                                        .fontWeight(.bold)
                                                        .foregroundColor(.white)
                                                        .padding(.top,-15)
                                                    
                                                }
                                                .padding(.top, 65)
    
                                                VStack{
                                                    Image(Matches.Team2)
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 50)
                                                        .shadow(color: .black, radius: 5, x: 5, y: 5)
                                                    Text(Matches.Team2Match2Score)
                                                        .font(.title)
                                                    
                                                        .fontWeight(.bold)
                                                        .foregroundColor(.white)
                                                        .padding(.top,-5)
                                                }
                                                .padding(.trailing, 20)
                                                .padding(.top, 45)
                                                
                                                
                                                
                                            }
                                        }
                                        .padding(.top, -45)
                                        ZStack{
                                            Image(Matches.Match3Map)
                                                .resizable()
                                                .aspectRatio( contentMode: .fit)
                                                .padding(.top, 40)
                                                .padding(.horizontal, 40)
                                            HStack{
                                                VStack{
                                                    Image(Matches.Team1)
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 50)
                                                        .shadow(color: .black, radius: 5, x: 5, y: 5)
                                                    Text(Matches.Team1Match3Score)
                                                        .font(.title)
                                                    
                                                        .fontWeight(.bold)
                                                        .foregroundColor(.white)
                                                        .padding(.top,-5)
                                                }
                                                .padding(.trailing, 50)
                                                .padding(.top, 45)
                                                VStack{
                                                    Text ("CONTROL")
                                                        .font(.title3)
                                                        .fontWeight(.bold)
                                                        .foregroundColor(.white)
                                                    
                                                    
                                                    Text(Matches.Match3Map)
                                                        .textCase(.uppercase)
                                                    
                                                        .font(.subheadline)
                                                        .fontWeight(.bold)
                                                        .foregroundColor(.white)
                                                        .padding(.top,-15)
                                                    
                                                }
                                                .padding(.top, 65)
                                                VStack{
                                                    Image(Matches.Team2)
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 50)
                                                        .shadow(color: .black, radius: 5, x: 5, y: 5)
                                                    Text(Matches.Team2Match3Score)
                                                        .font(.title)
                                                    
                                                        .fontWeight(.bold)
                                                        .foregroundColor(.white)
                                                        .padding(.top,-5)
                                                }
                                                .padding(.leading, 50)
                                                .padding(.top, 45)
                                                
                                            }
                                        }.padding(.top, -45)
                                        if Matches.Match4 == true {
                                            ZStack{
                                                Image(Matches.Match4Map)
                                                    .resizable()
                                                    .aspectRatio( contentMode: .fit)
                                                    .padding(.top, 40)
                                                    .padding(.horizontal, 40)
                                                HStack{
                                                    VStack{
                                                        Image(Matches.Team1)
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width: 50)
                                                            .shadow(color: .black, radius: 5, x: 5, y: 5)
                                                        Text(Matches.Team1Match4Score)
                                                            .font(.title)
                                                        
                                                            .fontWeight(.bold)
                                                            .foregroundColor(.white)
                                                            .padding(.top,-5)
                                                    }
                                                    .padding(.trailing, 33)
                                                    .padding(.top, 45)
                                                    VStack{
                                                        Text ("HARDPOINT")
                                                            .font(.title3)
                                                            .fontWeight(.bold)
                                                            .foregroundColor(.white)
                                                        
                                                        
                                                        Text(Matches.Match4Map)
                                                            .textCase(.uppercase)
                                                            .font(.subheadline)
                                                            .fontWeight(.bold)
                                                            .foregroundColor(.white)
                                                            .padding(.top,-15)
                                                        
                                                    }
                                                    .padding(.top, 65)
                                                    VStack{
                                                        Image(Matches.Team2)
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width: 50)
                                                            .shadow(color: .black, radius: 5, x: 5, y: 5)
                                                        Text(Matches.Team2Match4Score)
                                                            .font(.title)
                                                        
                                                            .fontWeight(.bold)
                                                            .foregroundColor(.white)
                                                            .padding(.top,-5)
                                                    }
                                                    .padding(.leading, 33)
                                                    .padding(.top, 45)
                                                }
                                            }
                                            .padding(.top, -45)
                                        }
                                        if Matches.Match5 == true {
                                            ZStack{
                                                Image("Asilo")
                                                    .resizable()
                                                    .aspectRatio( contentMode: .fit)
                                                    .padding(.top, 40)
                                                    .padding(.horizontal, 40)
                                                HStack{
                                                    VStack{
                                                        Image(Matches.Team1)
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width: 50)
                                                            .shadow(color: .black, radius: 5, x: 5, y: 5)
                                                        Text(Matches.Team1Score)
                                                            .font(.title)
                                                        
                                                            .fontWeight(.bold)
                                                            .foregroundColor(.white)
                                                            .padding(.top,-5)
                                                    }
                                                    .padding(.top, 45)
                                                    VStack{
                                                        Text ("SEARCH & DESTROY")
                                                            .font(.title3)
                                                            .fontWeight(.bold)
                                                            .foregroundColor(.white)
                                                        
                                                        
                                                        Text("MERCADO LAS ALMAS")
                                                        
                                                            .font(.subheadline)
                                                            .fontWeight(.bold)
                                                            .foregroundColor(.white)
                                                            .padding(.top,-15)
                                                        
                                                    }
                                                    .padding(.top, 65)
                                                    VStack{
                                                        Image(Matches.Team2)
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width: 50)
                                                            .shadow(color: .black, radius: 5, x: 5, y: 5)
                                                        Text(Matches.Team2Score)
                                                            .font(.title)
                                                        
                                                            .fontWeight(.bold)
                                                            .foregroundColor(.white)
                                                            .padding(.top,-5)
                                                    }
                                                    .padding(.top, 45)
                                                }
                                            }
                                            .padding(.top, -45)
                                        }
                                        if Matches.Match6 == true {
                                            ZStack{
                                                Image("Asilo")
                                                    .resizable()
                                                    .aspectRatio( contentMode: .fit)
                                                    .padding(.top, 40)
                                                    .padding(.horizontal, 40)
                                                HStack{
                                                    VStack{
                                                        Image(Matches.Team1)
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width: 50)
                                                            .shadow(color: .black, radius: 5, x: 5, y: 5)
                                                        Text(Matches.Team1Score)
                                                            .font(.title)
                                                        
                                                            .fontWeight(.bold)
                                                            .foregroundColor(.white)
                                                            .padding(.top,-5)
                                                    }
                                                    .padding(.trailing, 15)
                                                    .padding(.top, 45)
                                                    VStack{
                                                        Text ("CONTROL")
                                                            .font(.title3)
                                                            .fontWeight(.bold)
                                                            .foregroundColor(.white)
                                                        
                                                        
                                                        Text("MERCADO LAS ALMAS")
                                                        
                                                            .font(.subheadline)
                                                            .fontWeight(.bold)
                                                            .foregroundColor(.white)
                                                            .padding(.top,-15)
                                                        
                                                    }
                                                    .padding(.top, 65)
                                                    VStack{
                                                        Image(Matches.Team2)
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width: 50)
                                                            .shadow(color: .black, radius: 5, x: 5, y: 5)
                                                        Text(Matches.Team2Score)
                                                            .font(.title)
                                                        
                                                            .fontWeight(.bold)
                                                            .foregroundColor(.white)
                                                            .padding(.top,-5)
                                                    }
                                                    .padding(.leading, 15)
                                                    .padding(.top, 45)
                                                }
                                            }
                                            .padding(.top, -45)
                                        }
                                        if Matches.Match7 == true {
                                            ZStack{
                                                Image("Asilo")
                                                    .resizable()
                                                    .aspectRatio( contentMode: .fit)
                                                    .padding(.top, 40)
                                                    .padding(.horizontal, 40)
                                                HStack{
                                                    VStack{
                                                        Image(Matches.Team1)
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width: 50)
                                                            .shadow(color: .black, radius: 5, x: 5, y: 5)
                                                        Text(Matches.Team1Score)
                                                            .font(.title)
                                                        
                                                            .fontWeight(.bold)
                                                            .foregroundColor(.white)
                                                            .padding(.top,-5)
                                                    }
                                                    .padding(.top, 45)
                                                    VStack{
                                                        Text ("SEARCH & DESTROY")
                                                            .font(.title3)
                                                            .fontWeight(.bold)
                                                            .foregroundColor(.white)
                                                        
                                                        
                                                        Text("MERCADO LAS ALMAS")
                                                        
                                                            .font(.subheadline)
                                                            .fontWeight(.bold)
                                                            .foregroundColor(.white)
                                                            .padding(.top,-15)
                                                        
                                                    }
                                                    .padding(.top, 65)
                                                    VStack{
                                                        Image(Matches.Team2)
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width: 50)
                                                            .shadow(color: .black, radius: 5, x: 5, y: 5)
                                                        Text(Matches.Team2Score)
                                                            .font(.title)
                                                        
                                                            .fontWeight(.bold)
                                                            .foregroundColor(.white)
                                                            .padding(.top,-5)
                                                    }
                                                    .padding(.top, 45)
                                                }
                                            }
                                            .padding(.top, -45)
                                        }
                                    }
                                    
                                }
                            }
                        }
                    }
                    
                    
                    
                    
                }
            }
            
            
        }
            
        }
        
        
        
    }


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
