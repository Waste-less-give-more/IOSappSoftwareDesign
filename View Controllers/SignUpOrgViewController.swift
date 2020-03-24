//
//  SignUpOrgViewController.swift
//  WasteManagement
//
//  Created by Nadia Shalaby on 2020-03-23.
//  Copyright © 2020 NadiaAigayle. All rights reserved.
//

import UIKit

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
    }
    
    
}
