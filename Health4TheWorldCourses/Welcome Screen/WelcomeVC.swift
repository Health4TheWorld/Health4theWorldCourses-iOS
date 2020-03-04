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
    let exploreButton = UIButton(type: .custom)

    
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
        let buttonView = UIView()
        
        self.exploreButton.frame = CGRect(x: 0, y: 0, width: 240, height: 48)
        self.exploreButton.setTitle(Constants.ButtonTitles.exploreButtonTitle, for: .normal)
        self.exploreButton.addTarget(self, action: #selector(self.exploreButtonClicked), for: .touchUpInside)
        self.exploreButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        let shadows = UIView()
        shadows.frame = exploreButton.frame
        shadows.isUserInteractionEnabled = true
        shadows.clipsToBounds = false
        
        let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 5)
        
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 2
        layer0.shadowOffset = CGSize(width: 0, height: 2)
        layer0.bounds = shadows.bounds
        layer0.position = shadows.center
        shadows.layer.addSublayer(layer0)
        
        buttonView.addSubview(shadows)
        
        let shapes = UIView()
        shapes.isUserInteractionEnabled = true
        shapes.frame = self.exploreButton.frame
        shapes.clipsToBounds = true
        

        let layer1 = CALayer()
        layer1.backgroundColor = UIColor(red: 0.924, green: 0.409, blue: 0.376, alpha: 1).cgColor
        layer1.bounds = shapes.bounds
        layer1.position = shapes.center
        shapes.layer.addSublayer(layer1)
        shapes.layer.cornerRadius = 5
        buttonView.addSubview(shapes)
        
        self.exploreButton.addSubview(buttonView)
        
        self.exploreButton.contentHorizontalAlignment = .center
        self.exploreButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        
        
        
        self.view.addSubview(self.exploreButton)
        
  
        //setup constraints
        self.exploreButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.exploreButton.topAnchor.constraint(equalTo: self.medImage.bottomAnchor, constant: 120).isActive = true
        self.exploreButton.widthAnchor.constraint(equalToConstant: 240).isActive = true
        self.exploreButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    @available(iOS 13.0, *)
    @objc func exploreButtonClicked(){
        print("explore button clicked")
        
        let loginStoryboard = UIStoryboard(name: Constants.storyboard_login, bundle: Bundle.main)
        guard let destination = loginStoryboard.instantiateViewController(identifier: Constants.viewController_loginHomeVC) as? LoginHomeVC else{
            print(" Couldn't find the view controller")
            return
        }
        destination.navigationItem.title = Constants.titles.loginHome
        navigationController?.pushViewController(destination, animated: true)
    }
 
}
