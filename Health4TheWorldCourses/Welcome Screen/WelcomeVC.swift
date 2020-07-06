//
//  WelcomeVC.swift
//  Health4TheWorldCourses
//
//  Created by Premnath Ramanathan on 3/2/20.
//  Copyright © 2020 Health4TheWorld. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class WelcomeVC: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var medImage: UIImageView!
    var exploreButton =  CustomButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.isUserInteractionEnabled = true
        setupView()
    }
    
    func setupView(){
        let layer0 = CAGradientLayer()

        layer0.colors = [
          UIColor(red: 0.024, green: 0.525, blue: 0.463, alpha: 1).cgColor,
          UIColor(red: 0.09, green: 0.631, blue: 0.565, alpha: 1).cgColor,
          UIColor(red: 0.814, green: 0.904, blue: 0.893, alpha: 1).cgColor
        ]

        layer0.locations = [0.01, 0.29, 1]
        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 1, ty: 0))
        layer0.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)
        layer0.position = view.center
        backgroundView.layer.addSublayer(layer0)
        
        label1.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label2.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label3.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        // Button element
        
        setupButton()
    }
    
  
    
    func setupButton(){
        
        self.view.addSubview(self.exploreButton)
        
        self.exploreButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.exploreButton.topAnchor.constraint(equalTo: self.medImage.bottomAnchor, constant: 30).isActive = true
        
        self.exploreButton.addTarget(self, action: #selector(exploreButtonClicked), for: .touchUpInside)

    }
    
    @available(iOS 13.0, *)
    @objc func exploreButtonClicked(){
        print("explore button clicked")
        
        let loginStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let destination = loginStoryboard.instantiateViewController(identifier: Constants.segue_homeTab) as? CustomTabBar else{
            print(" Couldn't find the view controller")
            return
        }
        //destination.navigationItem.title = Constants.titles.loginHome
        self.navigationController?.pushViewController(destination, animated: true)
    }
 
}
