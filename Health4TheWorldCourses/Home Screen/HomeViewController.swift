//
//  HomeViewController.swift
//  Health4TheWorldCourses
//
//  Created by Premnath Ramanathan on 2/17/20.
//  Copyright © 2020 Health4TheWorld. All rights reserved.
//

import UIKit
import FirebaseFirestore

class HomeViewController: UIViewController {

    var cellIDRC = Constants.cellIDs.cellIDRC
    var cellIDUI = Constants.cellIDs.cellIDUI
    var cellIDSubjects = Constants.cellIDs.cellIDSubjects
    @IBOutlet weak var RCCollectionView: UICollectionView!
    @IBOutlet weak var subjectsTableView: UITableView!
    @IBOutlet weak var UECollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = Constants.titles.home
        setupView()
        
          let db = Firestore.firestore()
        db.collection(Constants.DBCollections.courses).getDocuments { (snapshot, error) in
            if error != nil {
                print(error!)
            }else{
                for document in (snapshot?.documents)! {
                    if let title = document.data()[Constants.Courses.title] as? String{
                        if let description = document.data()[Constants.Courses.description] as? String {
                            print(title, description)
                        }
                    }
                }
            }
        }
    }
    
    func setupView(){
        self.RCCollectionView?.backgroundColor = UIColor.red
        self.RCCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIDRC)
        
        self.UECollectionView?.backgroundColor = UIColor.green
        self.UECollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIDUI)
        
        
        RCCollectionView.delegate = self
        RCCollectionView.dataSource = self
        UECollectionView.delegate = self
        UECollectionView.dataSource = self
        
        subjectsTableView.dataSource = self
        subjectsTableView.delegate = self
        
        subjectsTableView.register(SubjectsViewCell.self, forCellReuseIdentifier: cellIDSubjects)
        UECollectionView.register(EventsViewCell.self, forCellWithReuseIdentifier: cellIDUI)
        RCCollectionView.register(Courses.self, forCellWithReuseIdentifier: cellIDRC)
    }
    
  
}

/* CollectionView Data Source */

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == RCCollectionView){
            return 5
        }else{
            return 3
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(collectionView == RCCollectionView){
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: cellIDRC, for: indexPath) as! Courses
            
            cell.backgroundColor = UIColor.green
            
            return cell
        }else{
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: cellIDUI, for: indexPath) as! EventsViewCell
            cell.backgroundColor = UIColor.blue
            
            return cell
        }
    }
}

/* Table View Data source */

extension HomeViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.Subjects.subjectsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIDSubjects, for: indexPath) as! SubjectsViewCell
    
        let subjects = Constants.Subjects.subjectsList
        
        cell.itemView.text = subjects[indexPath.row]
        
        cell.iconView.image = UIImage(named: Constants.Subjects.icons[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let title = UILabel()

        headerLabel(title, text: "Subjects")
        
        return title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    fileprivate func headerLabel(_ title: UILabel, text: String) {
        title.frame = CGRect(x: 0, y: 0, width: 63, height: 19)
        title.backgroundColor = .white
        title.textColor = UIColor(red: 0.416, green: 0.463, blue: 0.455, alpha: 1)
        title.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        title.text = text
    }
}

