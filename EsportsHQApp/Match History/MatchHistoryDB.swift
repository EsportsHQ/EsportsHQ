//
//  MatchHistoryDB.swift
//  EsportsHQ
//
//  Created by Nicholas Ruggles on 2/8/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MatchHistory: ObservableObject {
    @Published private(set) var History: [Matches] = []
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
            
            self.History = documents.compactMap { document -> Matches? in
                do{
                    return try document.data(as:Matches.self)
                } catch {
                    print("ERROR \(error)")
                    return nil
                }
               
            }
            self.History.sort { $1.TimeStamp < $0.TimeStamp}
            
            }
        }
    }
