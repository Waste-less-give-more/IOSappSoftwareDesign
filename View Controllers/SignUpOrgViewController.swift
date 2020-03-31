//
//  SignUpOrgViewController.swift
//  WasteManagement
//
//  Created by Nadia Shalaby on 2020-03-23.
//  Copyright © 2020 NadiaAigayle. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore
import FirebaseDatabase


class SignUpOrgViewController: UIViewController {
    

    @IBOutlet weak var orgName: UITextField!
    
    @IBOutlet weak var OrgPersonName: UITextField!
    
    @IBOutlet weak var OrgPnumber: UITextField!
    
    @IBOutlet weak var OrgDescription: UITextField!
    
    @IBOutlet weak var orgLocation: UITextField!
    
    @IBOutlet weak var orgWebsite: UITextField!
    
    @IBOutlet weak var orgEmail: UITextField!
    
    @IBOutlet weak var orgPassword: UITextField!
    
    
    @IBOutlet weak var signUpButton: UIButton!
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    @IBOutlet weak var navBar: UINavigationBar!
    
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
         setUpElements()
    }
    func setUpElements(){
        
        //Hide the error label
        errorLabel.alpha = 0
        
        //style the elements
        Utilities.styleTextField(orgName)
        
        Utilities.styleTextField(OrgPersonName)
        
        Utilities.styleTextField(OrgPnumber)
        
        Utilities.styleTextField(OrgDescription)
        
        Utilities.styleTextField(orgLocation)
        
        Utilities.styleTextField(orgWebsite)
        
        Utilities.styleTextField(orgEmail)
        
        Utilities.styleTextField(orgPassword)
        
        Utilities.styleFilledButton(signUpButton)
        
        
        
    }

// Check the fields and validate that the data is correct If everything is correct, return nil, otherqise it returns the error message
    
    func validateFields() -> String? {
        //check that all fields are filled in
        if orgName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || OrgPersonName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || OrgPnumber.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || OrgDescription.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || orgLocation.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || orgWebsite.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || orgEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || orgPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields"
            
    }
        //Check if the password is secure
        let cleanedPassword = orgPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
               
               if Utilities.isPasswordValid(cleanedPassword) == false {
                   // Password isn't secure enough
                   return "Please make sure your password is at least 8 characters, contains a special character and a number."
               }
               
            return nil

    }

    
    @IBAction func backTapped(_ sender: Any) {
       // self.transitionToHome()
        
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        
        //Validate the fields
        let error = validateFields()
        
        if error != nil {
            //there is something wrong with the fields, show error msg
            showError(message: error!)
        }
        else {
            //Create cleaned versions of the data
            let organization = orgName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let name = OrgPersonName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let number = OrgPnumber.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let description = OrgDescription.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let location = orgLocation.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let website = orgWebsite.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = orgEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = orgPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            //create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                //check for errors
                if err != nil {
                    //there was an error creating the user
                    self.showError(message: "Error Creating the user")
                }
                
                else{
                    //User successfully created, store data in firebse
                    
                   let user = Auth.auth().currentUser
                    Database.database().reference().child("users").child(user!.uid).setValue(["type": "admin"])
                    Constants.db.collection("organizations").addDocument(data: ["organization": organization, "name": name, "number": number, "description": description, "location": location, "website": website, "uid": result!.user.uid]){(error) in
                        if error != nil {
                            //show error msg
                            self.showError(message: "Error saving user data, try again in a minute")
                        }
                    }
                    //transition to the home screen
                    self.transitionToHome()
                }
        }
    }
}

func showError( message: String){
    
    errorLabel.text = message
    errorLabel.alpha = 1
    
}

func transitionToHome() {
    
    let homeViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
           
           view.window?.rootViewController = homeViewController
           view.window?.makeKeyAndVisible()
}
}
