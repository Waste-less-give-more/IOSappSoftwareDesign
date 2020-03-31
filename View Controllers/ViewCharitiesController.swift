//
//  ViewCharitiesController.swift
//  WasteManagement
//
//  Created by Nadia Shalaby on 2020-03-25.
//  Copyright © 2020 NadiaAigayle. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore
import SwiftUI

class ViewCharitiesController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        // Do any additional setup after loading the view.
        //data.Donations.addDocument(data: [""])
        readArray()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func readArray(){
         
        
        Constants.organizations.getDocuments{ (snapshot, error) in
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
