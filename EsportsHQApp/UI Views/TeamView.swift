//
//  TeamView.swift
//  EsportsHQ
//
//  Created by Nicholas Ruggles on 1/26/23.
//

import SwiftUI

struct TeamView: View {
   var faze = Color("Fazec")
    var breach = Color("Breachc")
    var mutineers = Color("Mutineersc")
    var ravens = Color("Ravensc")
    var guerrillas = Color("Guerrillasc")
    var thieves = Color("Thievesc")
    var rokkr = Color("Rokkrc")
    var subliners = Color("Sublinersc")
    var optic = Color("Opticc")
    var surge = Color("Surgec")
    var ultra = Color("Ultrac")
    var legion = Color("Legionc")
    @State var Fazeispresented = false
    @State var Breachispresented = false
    @State var Guerrillasispresented = false
    @State var Thievesispresented = false
    @State var Rokkrispresented = false
    @State var Opticispresented = false
    @State var Sublinersispresented = false
    @State var Ultraispresented = false
    @State var Ravensispresented = false
    @State var Legionispresented = false
    @State var Surgeispresented = false
    @State var Mutineersispresented = false
    
    
    
    var gradient = Gradient(colors: [Color("Button1"), Color("Button2")])
    private var images = ["car.fill","figure.walk"]
    
    
    private var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
 
    
    
    var body: some View {
        
        NavigationView{
        ZStack{
          
            
            Color("DarkBG")
            
            
                .ignoresSafeArea()
            
            VStack{
                HStack{
                    Text("Call of Duty Teams")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                    
                        .padding(.leading, 30.0)
                    
                    Spacer()
                }
                
                HStack(spacing: 30){
                    
                    VStack{
                        Button {
                            Fazeispresented = true
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(RadialGradient(gradient: gradient, center: .center, startRadius: 5, endRadius: 70))
                                    .shadow(color: faze, radius: 8)
                                    .frame(width: 90, height: 120)
                                
                                
                                VStack{
                                    
                                    Image("Faze")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    Text("ATLANTA    FAZE")
                                        .foregroundColor(.white)
                                        .font(.caption2)
                                        .fontWeight(.bold)
                                    
                                }
                                .frame(width: 90, height: 120)
                            }
                        }
                        .fullScreenCover( isPresented: $Fazeispresented) {
                            VStack{
                                Faze()
                            }
                        }
                        .padding(.bottom)

             
                        Button {
                            Ravensispresented = true
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(RadialGradient(gradient: gradient, center: .center, startRadius: 5, endRadius: 70))
                                    .shadow(color: ravens, radius: 8)
                                    .frame(width: 90, height: 120)
                                
                                
                                VStack{
                                    
                                    Image("Ravens")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    Text("LONDON ROYAL RAVENS")
                                        .foregroundColor(.white)
                                        .font(.caption2)
                                        .fontWeight(.bold)
                                    
                                }
                                .frame(width: 75, height: 120)
                                
                            }
                            .fullScreenCover( isPresented: $Ravensispresented) {
                                VStack{
                                    Ravens()
                                }
                            }
                            
                        }
                        
                        .padding(.bottom)
                        
                        Button {
                            Rokkrispresented = true
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(RadialGradient(gradient: gradient, center: .center, startRadius: 5, endRadius: 70))
                                    .shadow(color: ultra, radius: 8)
                                    .frame(width: 90, height: 120)
                                
                                
                                VStack{
                                    
                                    Image("Rokkr")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    Text("MINNESOTA RØKKR")
                                        .foregroundColor(.white)
                                        .font(.caption2)
                                        .fontWeight(.bold)
                                    
                                }
                                .frame(width: 75, height: 120)
                                
                                
                            }
                            .fullScreenCover( isPresented: $Rokkrispresented) {
                                VStack{
                                    Rokkr()
                                }
                            }
                            
                        }
                        
                        .padding(.bottom)
                        
                        Button {
                            Surgeispresented = true
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(RadialGradient(gradient: gradient, center: .center, startRadius: 5, endRadius: 70))
                                    .shadow(color: surge, radius: 8)
                                    .frame(width: 90, height: 120)
                                
                                
                                VStack{
                                    
                                    Image("Surge")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    Text("SEATTLE SURGE")
                                        .foregroundColor(.white)
                                        .font(.caption2)
                                        .fontWeight(.bold)
                                    
                                }
                                .frame(width: 75, height: 120)
                                
                                
                            }
                            .fullScreenCover( isPresented: $Surgeispresented) {
                                VStack{
                                    Surge()
                                }
                            }
                            
                        }
                        
                        .padding(.bottom)
                        
                        
                    }
                    
                    VStack{
                        
                        Button {
                            Breachispresented = true
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(RadialGradient(gradient: gradient, center: .center, startRadius: 5, endRadius: 70))
                                    .shadow(color: breach, radius: 8)
                                    .frame(width: 90, height: 120)
                                
                                
                                VStack{
                                    
                                    Image("Breach")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    Text("BOSTON BREACH")
                                        .foregroundColor(.white)
                                        .font(.caption2)
                                        .fontWeight(.bold)
                                    
                                }
                                .frame(width: 75, height: 120)
                                
                                
                            }
                            .fullScreenCover( isPresented: $Breachispresented) {
                                VStack{
                                    Breach()
                                }
                            }
                            
                        }
                        
                        .padding(.bottom)
                        
                        
                        Button {
                            Guerrillasispresented = true
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(RadialGradient(gradient: gradient, center: .center, startRadius: 5, endRadius: 70))
                                    .shadow(color: guerrillas, radius: 8)
                                    .frame(width: 90, height: 120)
                                
                                
                                VStack{
                                    
                                    Image("Guerrillas")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    Text("LOS ANGELES GUERRILLAS")
                                        .foregroundColor(.white)
                                        .font(.caption2)
                                        .fontWeight(.bold)
                                    
                                }
                                .frame(width: 75, height: 120)
                                
                                
                            }
                            .fullScreenCover( isPresented: $Guerrillasispresented) {
                                VStack{
                                    Guerrillas()
                                }
                            }
                            
                        }
                        
                        .padding(.bottom)
                        
                        
                        Button {
                            Sublinersispresented = true
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(RadialGradient(gradient: gradient, center: .center, startRadius: 5, endRadius: 70))
                                    .shadow(color: subliners, radius: 8)
                                    .frame(width: 90, height: 120)
                                
                                
                                VStack{
                                    
                                    Image("Subliners")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    Text("NEW YORK SUBLINERS")
                                        .foregroundColor(.white)
                                        .font(.caption2)
                                        .fontWeight(.bold)
                                    
                                }
                                .frame(width: 75, height: 120)
                                
                                
                            }
                            .fullScreenCover( isPresented: $Sublinersispresented) {
                                VStack{
                                    Subliners()
                                }
                            }
                            
                        }
                        
                        .padding(.bottom)
                        
                        
                        Button {
                            Ultraispresented = true
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(RadialGradient(gradient: gradient, center: .center, startRadius: 5, endRadius: 70))
                                    .shadow(color: ultra, radius: 8)
                                    .frame(width: 90, height: 120)
                                
                                
                                VStack{
                                    
                                    Image("Ultra")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    Text("TORONTO ULTRA")
                                        .foregroundColor(.white)
                                        .font(.caption2)
                                        .fontWeight(.bold)
                                    
                                }
                                .frame(width: 75, height: 120)
                                
                                
                            }
                            .fullScreenCover( isPresented: $Ultraispresented) {
                                VStack{
                                    Ultra()
                                }
                            }
                            
                        }
                        
                        .padding(.bottom)
                    }
                    
                    VStack{
                        Button {
                            Mutineersispresented = true
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(RadialGradient(gradient: gradient, center: .center, startRadius: 5, endRadius: 70))
                                    .shadow(color: mutineers, radius: 8)
                                    .frame(width: 90, height: 120)
                                
                                
                                VStack{
                                    
                                    Image("Mutineers")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    Text("FLORIDA MUTINEERS")
                                        .foregroundColor(.white)
                                        .font(.caption2)
                                        .fontWeight(.bold)
                                    
                                }
                                .frame(width: 75, height: 120)
                                
                                
                            }
                            .fullScreenCover( isPresented: $Mutineersispresented) {
                                VStack{
                                    Mutineers()
                                }
                            }
                            
                        }
                        
                        .padding(.bottom)
                        
                        
                        Button {
                            Thievesispresented = true
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(RadialGradient(gradient: gradient, center: .center, startRadius: 5, endRadius: 70))
                                    .shadow(color: thieves, radius: 8)
                                    .frame(width: 90, height: 120)
                                
                                
                                VStack{
                                    
                                    Image("Thieves")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    Text("LOS ANGELES THIEVES")
                                        .foregroundColor(.white)
                                        .font(.caption2)
                                        .fontWeight(.bold)
                                    
                                }
                                .frame(width: 75, height: 120)
                                
                                
                            }
                            .fullScreenCover( isPresented: $Thievesispresented) {
                                VStack{
                                    Thieves()
                                }
                            }
                            
                        }
                        
                        .padding(.bottom)
                        
                        
                        Button {
                            Opticispresented = true
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(RadialGradient(gradient: gradient, center: .center, startRadius: 5, endRadius: 70))
                                    .shadow(color: optic, radius: 8)
                                    .frame(width: 90, height: 120)
                                
                                
                                VStack{
                                    
                                    Image("Optic")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    
                                    Text("OPTIC TEXAS")
                                        .foregroundColor(.white)
                                        .font(.caption2)
                                        .fontWeight(.bold)
                                    
                                }
                                .frame(width: 75, height: 120)
                                
                                
                            }
                            .fullScreenCover( isPresented: $Opticispresented) {
                                VStack{
                                    Optic()
                                }
                            }
                            
                        }
                        
                        .padding(.bottom)
                        
                        
                        Button {
                            Legionispresented = true
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(RadialGradient(gradient: gradient, center: .center, startRadius: 5, endRadius: 70))
                                    .shadow(color: legion, radius: 8)
                                    .frame(width: 90, height: 120)
                                
                                
                                VStack{
                                    
                                    Image("Legion")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    Text("VEGAS LEGION")
                                        .foregroundColor(.white)
                                        .font(.caption2)
                                        .fontWeight(.bold)
                                    
                                }
                                .frame(width: 75, height: 120)
                                
                                
                            }
                            .fullScreenCover( isPresented: $Legionispresented) {
                                VStack{
                                    Legion()
                                }
                            }
                            
                        }
                        
                        .padding(.bottom)
                        
                    }
                    
                }
                
                
                
            }
            .padding(.top)
            
        }
       
    }
        
    }
    
    struct TeamView_Previews: PreviewProvider {
        static var previews: some View {
            TeamView()
        }
    }
    
}
