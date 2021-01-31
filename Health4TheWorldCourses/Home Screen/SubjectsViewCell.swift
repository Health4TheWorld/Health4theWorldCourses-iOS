//
//  SubjectsViewCell.swift
//  Health4TheWorldCourses
//
//  Created by Premnath Ramanathan on 2/23/20.
//  Copyright © 2020 Health4TheWorld. All rights reserved.
//

import UIKit

class SubjectsViewCell: UITableViewCell {
    
    // var containingViewController: UIViewController // ?
    
    let itemView: UILabel = {
        let item = UILabel()
        //item.frame = CGRect(x: 0, y: 0, width: 187, height: 48)
        item.backgroundColor = .white
        item.textColor = UIColor(red: 0.416, green: 0.463, blue: 0.455, alpha: 1)
        item.font = UIFont(name: "HelveticaNeue-Regular", size: 16)
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()
    let button = UIButton(type: .custom)
    let iconView: UIImageView = {
        let icon = UIImageView()
        //icon.frame = CGRect(x: 0, y: 0, width: 24, height: 22.67)
        icon.backgroundColor = .white
        //icon.layer.backgroundColor = UIColor(red: 0.09, green: 0.631, blue: 0.565, alpha: 1).cgColor
        icon.clipsToBounds = true
        icon.translatesAutoresizingMaskIntoConstraints = false
        
        return icon
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
       // self.contentView.frame = CGRect(x: 0, y: 10, width: 60, height: 60)
        
        self.addSubview(iconView)
        self.addSubview(itemView)
        
        let image = UIImage(named: "greaterThan-green-icon")
        button.setImage(image, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        button.addTarget(self, action: #selector(handleProfileSelect)
            , for: .touchUpInside)
        
        accessoryView = button
        
        setupConstraints()
    }
    
    private func setupConstraints(){
        /* Constraints */
        iconView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        iconView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
         //iconView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        //iconView.topAnchor.constraint(equalTo: topAnchor).isActive = true
       // iconView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: 24).isActive = true
         iconView.heightAnchor.constraint(equalToConstant: 22.67).isActive = true
        //iconView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 5)
        
        itemView.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 10).isActive = true
        //itemView.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: 10)
        //itemView.widthAnchor.constraint(equalToConstant: 187)
        itemView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        itemView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        itemView.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
    }
    
    @objc private func handleProfileSelect(){
        print("item selected")
        // self.containingViewController.performSegue(withIdentifier: "showSubject", sender: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
