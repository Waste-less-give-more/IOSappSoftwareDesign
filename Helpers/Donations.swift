//
//  Donations.swift
//  WasteManagement
//
//  Created by Nadia Shalaby on 2020-03-25.
//  Copyright © 2020 NadiaAigayle. All rights reserved.
//

import Foundation
import Firebase
import UIKit
import SwiftUI
import CoreLocation

struct data {
    
   
    static let DocName = Constants.db
    static let food = DocName.collection("food")
    static let clothes = DocName.collection("clothes")
    static let misc = DocName.collection("misc")
    
    func readArray(){
        
        
        data.food.getDocuments{ (snapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in snapshot!.documents {
                    let donationUID = document.documentID
                    //let donationType = document.get("type") as! String
                    let donationLabel = document.get("label") as! String
                    let time = document.get("time") as! Timestamp
                    print(donationUID, time, donationLabel)
                    
                }
            }
        }
        
        data.clothes.getDocuments{ (snapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in snapshot!.documents {
                    let donationUID = document.documentID
                    //let donationType = document.get("type") as! String
                    let donationLabel = document.get("label") as! String
                    let time = document.get("time") as! Timestamp
                    print(donationUID, time, donationLabel)
                    
                }
            }
        }
        
        data.misc.getDocuments{ (snapshot, error) in
                   if let error = error {
                       print("Error getting documents: \(error)")
                   } else {
                       for document in snapshot!.documents {
                           let donationUID = document.documentID
                           //let donationType = document.get("type") as! String
                           let donationLabel = document.get("label") as! String
                           let time = document.get("time") as! Timestamp
                           print(donationUID, time, donationLabel)
                           
                       }
                   }
               }
           
       }
    

//static let food = Donations.whereField("label", isEqualTo: "food")
   // func hello(){
        
    //    print(data.food)
        
    //  }

//static let clothes = Donations.whereField("label", isEqualTo: "clothes")

//static let misc = Donations.whereField("label", isEqualTo: "misc")


}

//struct donations {

    //var id: int
    
    
    
    
//}
