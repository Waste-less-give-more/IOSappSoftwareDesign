//
//  Organizations.swift
//  WasteManagement
//
//  Created by Nadia Shalaby on 2020-03-29.
//  Copyright © 2020 NadiaAigayle. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore
import UIKit
import SwiftUI



struct Organizations {
    
    static let DocName = Constants.db
    static let organizations = DocName.collection("organizations")
    
    
    func readArray(){
        
        
        Organizations.organizations.getDocuments{ (snapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in snapshot!.documents {
                    let orgUID = document.documentID
                    //let donationType = document.get("type") as! String
                    let description = document.get("description") as! String
                    let location = document.get("location") as! String
                    let name = document.get("name") as! String
                    let organization = document.get("organization") as! String
                    let type = document.get("type") as! Bool
                    let website = document.get("website") as! String
                    let number = document.get("number") as! Timestamp
                    print(orgUID, description,location, name, organization, type,  website, number )
                    
                    
                }
            }
        }
    }
    
    
    
    
}
