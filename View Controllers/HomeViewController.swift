//
//  HomeViewController.swift
//  WasteManagement
//
//  Created by Nadia Shalaby on 2020-03-23.
//  Copyright © 2020 NadiaAigayle. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var viewCharitiesButton: UIButton!
    
    @IBOutlet weak var donateItemsButton: UIButton!
    
    @IBOutlet weak var donateMoneyButton: UIButton!
    
    @IBOutlet weak var factsButton: UIButton!
    
    @IBOutlet weak var navBar: UINavigationBar!
    
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    func setUpElements() {
        //style the buttons
        Utilities.styleFilledButton(viewCharitiesButton)
        Utilities.styleFilledButton(donateItemsButton)
        Utilities.styleFilledButton(donateMoneyButton)
        Utilities.styleHollowButton(factsButton)
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
    
    
    @IBAction func charitesButtonTapped(_ sender: Any) {
        
        //transition to the charities page
    }
    @IBAction func donateItemsTaped(_ sender: Any) {
        
        //transition to the donate items page
    }
    @IBAction func donateMoneyTapped(_ sender: Any) {
        
        //transition to the donate money page
    }
    
    @IBAction func factsTapped(_ sender: Any) {
        
        //transition to the facts page
    }
    
}


