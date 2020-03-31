//
//  SignUpViewController.swift
//  WasteManagement
//
//  Created by Nadia Shalaby on 2020-03-23.
//  Copyright © 2020 NadiaAigayle. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore
import SwiftUI
import FirebaseDatabase


class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var PersonalFirstName: UITextField!
    
    @IBOutlet weak var PersonalLastName: UITextField!
    
    @IBOutlet weak var PersonalEmail: UITextField!
    
    
    @IBOutlet weak var PersonalPassword: UITextField!
    
    @IBOutlet weak var SignUpButton: UIButton!
    
    @IBOutlet weak var ErrorLabel: UILabel!
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
  
    
    @IBOutlet weak var navBackButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpElements()
        //setUpNavigationBarItems()
    }
    /*func setUpNavigationBarItems() {
        let back = UIImage(named: "back-button.png")
        let label = UILabel()
        let navView = UIView()
        label.text = "Sign Up Personal Account"
        label.sizeToFit()
        label.center = navView.center
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.systemFont(ofSize: 20.00)
        label.textColor = UIColor.black
        
        
        //let backButton = UIImageView(image: back)
        //backButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        //backButton.contentMode = .scaleAspectFit
        
        
        //navigationItem.titleView = titleImageView
        
        let bkButton = UIButton(type: .system)
        bkButton.setImage(back?.withRenderingMode(.alwaysOriginal), for: .normal)
        bkButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: bkButton)
        
    }*/
    func setUpElements(){
        
        //Hide the error label
        ErrorLabel.alpha = 0
        
        //style the elements
        Utilities.styleTextField(PersonalFirstName)
        
        Utilities.styleTextField(PersonalLastName)
        
        Utilities.styleTextField(PersonalEmail)
        
        Utilities.styleTextField(PersonalPassword)
        
        Utilities.styleFilledButton(SignUpButton)
        
        Utilities.backButton(navBackButton)
        
        
        
        
    }
    

    
    
    //check the fields and validate that the data is correct
    //if everything is correct, this method returns nil. Otherwise, it returns the error message.
    func validateFields() -> String? {
        
        //check that all fields are filled in
        if PersonalFirstName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || PersonalLastName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || PersonalEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || PersonalPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            return "Please fill in all fields"
        }
        
        //check if the password is secure
        
        let cleanedPassword = PersonalPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(cleanedPassword) == false {
            //password isn't secure enough
            return "Please make sure your password is a least 8 characters, contains a special character and a number"
        }
        
        
        
        return nil
        
    }
    
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        //back to previous screen
    }
    
    @IBAction func SignUpTapped(_ sender: Any) {
        
        //Validate the fields
        let error = validateFields()
        if error != nil {
            //there is something wrong with the fields
            showError(message: error!)
            
           
        }
            
        
        
        else {
            //Create cleaned versions of the data
            let firstName = PersonalFirstName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = PersonalLastName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = PersonalEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = PersonalPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
        
        //Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                if err != nil {
                    
                    //there was an error creating the user
                    self.showError(message: "Error creating user")
                }
                else {
                    //User was successfully created, now store the first name and last name
                    //let uid = result?.user.uid
                    let user = Auth.auth().currentUser
                    
                    let db = Firestore.firestore()
                    db.collection("users").addDocument( data:
                    ["firstName" : firstName, "lastName" : lastName, "uid": result!.user.uid]) {(error) in
                Database.database().reference().child("users").child(user!.uid).setValue(["type": "user"])
                        
                        if error != nil {
                        //show error message
                        self.showError(message: "Try again in a couple minutes")
                        
                            
                        }
                    
                }
                 //Transition to the home screen
                    
                    self.transitionToHome()
                    
            }
        
        }
    }
    }
    
    func showError(message:String){
        ErrorLabel.text = message
        ErrorLabel.alpha = 1
    }
    
    func transitionToHome(){
        
        let homeViewController =
            storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as?
                HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
    }
}

