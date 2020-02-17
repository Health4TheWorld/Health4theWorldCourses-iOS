//
//  Profile.swift
//  Health4TheWorldCourses
//
//  Created by Premnath Ramanathan on 2/16/20.
//  Copyright © 2020 Health4TheWorld. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {
    
     let itemView = UILabel()
    let button = UIButton(type: .custom)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
       
        
        itemView.frame = CGRect(x: 0, y: 0, width: 256, height: 48)
        itemView.backgroundColor = .white
        itemView.textColor = UIColor(red: 0.333, green: 0.333, blue: 0.333, alpha: 1)
        
        itemView.font = UIFont(name: "HelveticaNeue-Regular", size: 14)
        
        self.addSubview(itemView)
        
      
        let image = UIImage(named: "greaterThan-green-icon")
        button.setImage(image, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        button.addTarget(self, action: #selector(handleProfileSelect)
            , for: .touchUpInside)
        
        accessoryView = button
        
    }
    
    @objc private func handleProfileSelect(){
        print("item selected")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


