//
//  CustomButton.swift
//  Health4TheWorldCourses
//
//  Created by Premnath Ramanathan on 7/4/20.
//  Copyright © 2020 Health4TheWorld. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented yet")
    }
    
    func setupButton(){
        setupFrames()
        let buttonView = UIView()
        
        let shadows = UIView()
        setupShadows(shadows, buttonView)
        buttonView.addSubview(shadows)
        
        let shapes = UIView()
        setupShapes(shapes)
        buttonView.addSubview(shapes)
        
        self.addSubview(buttonView)
        
        self.contentHorizontalAlignment = .center
        self.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        
        setupConstraints()
    }
    
    fileprivate func setupShadows(_ shadows: UIView, _ buttonView: UIView) {
        shadows.frame = buttonView.frame
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
      }
      
      fileprivate func setupShapes(_ shapes: UIView) {
          shapes.isUserInteractionEnabled = true
          shapes.frame = self.frame
          shapes.clipsToBounds = true
          
          
          let layer1 = CALayer()
          layer1.backgroundColor = UIColor(red: 0.924, green: 0.409, blue: 0.376, alpha: 1).cgColor
          layer1.bounds = shapes.bounds
          layer1.position = shapes.center
          shapes.layer.addSublayer(layer1)
          shapes.layer.cornerRadius = 5
      }
      
    fileprivate func setupConstraints() {
        //setup constraints
        
        widthAnchor.constraint(equalToConstant: 240).isActive = true
        heightAnchor.constraint(equalToConstant: 48).isActive = true
      }
      
      fileprivate func setupFrames() {
        frame = CGRect(x: 0, y: 0, width: 240, height: 48)
        setTitle(Constants.ButtonTitles.exploreButtonTitle, for: .normal)
        
        translatesAutoresizingMaskIntoConstraints = false
      }
}
