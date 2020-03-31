//
//  Constants.swift
//  WasteManagement
//
//  Created by Nadia Shalaby on 2020-03-24.
//  Copyright © 2020 NadiaAigayle. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct Constants {
    
    
    static let db = Firestore.firestore()
    static let organizations = db.collection("organizations")
    
    struct Storyboard {
        static let homeViewController = "HomeVC" // we only write HomeVC here so we avoid typos
    }
    //create a get user type function to make homepage view easier for both organizations
    //and people
    func getUserType(){
        
    }
}
