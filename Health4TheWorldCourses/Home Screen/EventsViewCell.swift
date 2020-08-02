//
//  EventsViewCell.swift
//  Health4TheWorldCourses
//
//  Created by Premnath Ramanathan on 2/23/20.
//  Copyright © 2020 Health4TheWorld. All rights reserved.
//

import UIKit

class EventsViewCell: UICollectionViewCell {
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
        item.font = UIFont(name: "Roboto-Bold", size: 14)
        item.font = item.font.withSize(14)
        item.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        item.backgroundColor = .white
        return item
    }()
    
    let author: UILabel = {
        let desc = UILabel()
        desc.translatesAutoresizingMaskIntoConstraints = false
        desc.font = UIFont(name: "Roboto-Regular", size: 12)
        desc.font = desc.font.withSize(12)
        desc.textColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        desc.backgroundColor = .white
        //desc.numberOfLines = 0
        //desc.lineBreakMode = .byWordWrapping
        return desc
    }()
    
    let place: UILabel = {
        let desc = UILabel()
        desc.translatesAutoresizingMaskIntoConstraints = false
        desc.font = UIFont(name: "Roboto-Regular", size: 12)
        desc.font = desc.font.withSize(12)
        desc.textColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        desc.backgroundColor = .white
        return desc
    }()
    
    let eventsImage: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "favStar")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 8
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    let dateView: UIView = {
        let item = UIView()
        item.backgroundColor = .white
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()
    
    
    let date: UILabel = {
        let item = UILabel()
        item.translatesAutoresizingMaskIntoConstraints = false
        item.font = UIFont(name: "Roboto-Regular", size: 16)
        item.font = item.font.withSize(16)
        item.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        item.backgroundColor = .white
        return item
    }()
    
    
    let time: UILabel = {
        let item = UILabel()
        item.translatesAutoresizingMaskIntoConstraints = false
        item.font = UIFont(name: "Roboto-Regular", size: 12)
        item.font = item.font.withSize(12)
        item.textColor = UIColor(red: 0.416, green: 0.463, blue: 0.455, alpha: 1)
        item.backgroundColor = .white
        return item
    }()
    

    func setupCell(){
        self.dateView.addSubview(date)
        self.dateView.addSubview(eventsImage)
        let stackView =  UIStackView(arrangedSubviews: [dateView,time,title, author,place])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        contentView.addSubview(stackView)
        
        setupShadowsforCells()
        
        NSLayoutConstraint.activate([
            date.leadingAnchor.constraint(equalTo: dateView.leadingAnchor, constant: 5),
            eventsImage.trailingAnchor.constraint(equalTo: dateView.trailingAnchor, constant: -5),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
        
        if #available(iOS 11.0, *) {
            stackView.setCustomSpacing(5, after: dateView)
            stackView.setCustomSpacing(5, after: time)
            stackView.setCustomSpacing(5, after: title)
            stackView.setCustomSpacing(5, after: author)
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    func setupShadowsforCells(){
        self.contentView.layer.cornerRadius = 3.0
        self.contentView.layer.borderWidth = 3.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true

        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 12.0
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
        
         self.layer.cornerRadius = 3.0
        
        self.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
        self.layer.backgroundColor = UIColor.clear.cgColor
    }
    
    func configure(with app: EventsModel){
        title.text = app.title.uppercased()
        author.text = app.author
        place.text = app.place
        date.text = app.date
        time.text = app.time
    }
}
