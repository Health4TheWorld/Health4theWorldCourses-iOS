//
//  LoginHomeVC.swift
//  Health4TheWorldCourses
//
//  Created by Premnath Ramanathan on 3/2/20.
//  Copyright © 2020 Health4TheWorld. All rights reserved.
//

import UIKit

class LoginHomeVC: UIViewController {
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    func setupView(){
        label1.text = ConstantTexts.loginHomePage.label1Text
        label2.text = ConstantTexts.loginHomePage.label2Text
        
        
    }

}

