//
//  SignUpViewController.swift
//  WasteManagement
//
//  Created by Nadia Shalaby on 2020-03-23.
//  Copyright © 2020 NadiaAigayle. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var PersonalFirstName: UITextField!
    
    @IBOutlet weak var PersonalLastName: UITextField!
    
    @IBOutlet weak var PersonalEmail: UITextField!
    
    
    @IBOutlet weak var PersonalPassword: UITextField!
    
    @IBOutlet weak var SignUpButton: UIButton!
    
    @IBOutlet weak var ErrorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpElements()
    }
    
    func setUpElements(){
        
        //Hide the error label
        ErrorLabel.alpha = 0
        
        //style the elements
        Utilities.styleTextField(PersonalFirstName)
        
        Utilities.styleTextField(PersonalLastName)
        
        Utilities.styleTextField(PersonalEmail)
        
        Utilities.styleTextField(PersonalPassword)
        
        Utilities.styleFilledButton(SignUpButton)
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func SignUpTapped(_ sender: Any) {
    }
    
}
