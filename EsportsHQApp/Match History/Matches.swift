//
//  Matches.swift
//  EsportsHQApp
//
//  Created by Nicholas Ruggles on 2/9/23.
//

import Foundation

struct Matches:  Identifiable, Codable {
    var id: String
    var Team1: String
    var Team2: String
    var TimeStamp: Date
    var Team1Score: String
    var Team2Score: String
    var MatchURL: String
    var Event: String
    var Match4: Bool
    var Match5: Bool
    var Match6: Bool
    var Match7: Bool
    var Match1Map: String
    var Match2Map: String
    var Match3Map: String
    var Match4Map: String
    var Team1Match1Score: String
    var Team1Match2Score: String
    var Team1Match3Score: String
    var Team1Match4Score: String
    var Team2Match1Score: String
    var Team2Match2Score: String
    var Team2Match3Score: String
    var Team2Match4Score: String
    var IsLive: Bool
    var CurrentMap: String
    var CurrentMode: String
    }
    
