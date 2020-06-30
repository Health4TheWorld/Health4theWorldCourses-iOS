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
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var googleSignIn: UIButton!
    @IBOutlet weak var fbSignIn: UIButton!
    @IBOutlet weak var emailSignIn: UIButton!
    
    @IBOutlet weak var stackView2: UIStackView!
    @IBOutlet weak var alreadyUserLabel: UILabel!
    @IBOutlet weak var LogInButton: UIButton!
    @IBOutlet weak var SkipButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    func setupView(){
        label1.text = ConstantTexts.loginHomePage.label1Text
        label2.text = ConstantTexts.loginHomePage.label2Text
        
        setupStackView1()
        
    }
    
    func setupStackView1(){
        googleSignIn.setTitle(Constants.ButtonTitles.googleButtonTitle, for: .normal)
        fbSignIn.setTitle(Constants.ButtonTitles.facebookButtonTitle, for: .normal)
        emailSignIn.setTitle(Constants.ButtonTitles.emailSignUpTitle, for: .normal)
        
        
        
    }
    
    @IBAction func googleSignInClicked(_ sender: Any) {
    }
    
    @IBAction func fbSignInClicked(_ sender: Any) {
    }
    
    @IBAction func emailSignInClicked(_ sender: Any) {
    }
    
    @IBAction func LoginClicked(_ sender: Any) {
    }
    
    @IBAction func skipClicked(_ sender: Any) {
    }
    
}

