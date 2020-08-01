//
//  Courses.swift
//  Health4TheWorldCourses
//
//  Created by Premnath Ramanathan on 2/20/20.
//  Copyright © 2020 Health4TheWorld. All rights reserved.
//

import UIKit

class Courses: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupCell()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let title: UILabel = {
        let item = UILabel()
        item.translatesAutoresizingMaskIntoConstraints = false
        item.font = UIFont(name: "Roboto-Medium", size: 16)
        item.font = item.font.withSize(14)
        item.textColor = UIColor(red: 0.016, green: 0.125, blue: 0.11, alpha: 1)
        item.backgroundColor = .white
        return item
    }()
    
    let author: UILabel = {
        let desc = UILabel()
        desc.translatesAutoresizingMaskIntoConstraints = false
        desc.font = UIFont(name: "Roboto-Regular", size: 14)
        desc.font = desc.font.withSize(12)
        desc.textColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        desc.backgroundColor = .white
        return desc
    }()
    
    var image: UIImage? {
        didSet{
            guard let image = image else  {return}
            coursesImage.image = image
        }
    }
    
    let coursesImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "reco-image")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 8
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()

    func setupCell(){
        let stackView =  UIStackView(arrangedSubviews: [coursesImage,title, author])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        contentView.addSubview(stackView)
        
        setupShadowsforCells()
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
        
        if #available(iOS 11.0, *) {
            stackView.setCustomSpacing(10, after: title)
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    func setupShadowsforCells(){
        self.contentView.layer.cornerRadius = 12.0
        self.contentView.layer.borderWidth = 3.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true

        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
        
         self.layer.cornerRadius = 6.0
        
        self.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
        self.layer.backgroundColor = UIColor.clear.cgColor
    }
    
    func configure(with app: CoursesModel){
        title.text = app.title.uppercased()
        author.text = app.author
        //coursesImage.image = UIImage(named: app.)
    }
}
