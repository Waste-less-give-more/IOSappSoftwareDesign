//
//  LoginViewController.swift
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

class LoginViewController: UIViewController {

    
    @IBOutlet weak var EmailTextfield: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var ErrorLabel: UILabel!
    
    @IBOutlet weak var navBar: UINavigationBar!
    
    
    @IBOutlet weak var backButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
         setUpElements()
    }
    //get user type and return bool (true if organizaion false if personal)
   // func getUserType(){
      //  var user = false
      //  let userType = Constants.db.collection("users").whereField("type", //isEqualTo:  <#T##[Any]#>)
        
        
        
    //   }
    func setUpElements(){
        
        //Hide the error label
        ErrorLabel.alpha = 0
        
        //style the elements
        Utilities.styleTextField(EmailTextfield)
        
        Utilities.styleTextField(passwordTextfield)
    
        
        Utilities.styleFilledButton(loginButton)
        
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func backTapped(_ sender: Any) {
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        //validate Text Fields
        //Create Cleaned versions of the text field
        let email = EmailTextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
       // let userType =
        
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password){
            (result, error) in
            
            if error != nil {
                //couldn't sign in
                self.ErrorLabel.text = error!.localizedDescription
                self.ErrorLabel.alpha = 1
            }
            else if let result = result {
                let uid = result.user.uid
                let user = Auth.auth().currentUser
                
                Database.database().reference().child("users/\(user!.uid)/type").observeSingleEvent(of: .value, with: {
                    (snapshot) in
                    
                    switch snapshot.value as! String {
                        
                    case "admin": break
                        
                    case "user": break
                        
                    default: break
                        
                    }
                })
                
                
                
                
                
                
                let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
                
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
  
}
