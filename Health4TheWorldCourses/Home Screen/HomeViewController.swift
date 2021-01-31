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
    // Courses Model
    var coursesList = [CoursesModel]()
    var images = [UIImage]()
    
    @IBOutlet weak var upcomingEventsLabel: UILabel!
    @IBOutlet weak var recommendedCoursesLabel: UILabel!
    // Event Model
    var eventsList = [EventsModel]()
    
    
    //  Firestore DB
    let db = Firestore.firestore()
    
    
    private var coursesRef : CollectionReference!
    private var eventsRef:  CollectionReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        print("setupView completed!")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        coursesRef = db.collection(Constants.DBCollections.courses)
        eventsRef = db.collection(Constants.DBCollections.events)
        fetchCourses()
        fetchEvents()
        print("courses fetched")
    }
    
    func setupView(){
        self.RCCollectionView?.backgroundColor = UIColor.white
        self.RCCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIDRC)
        
        self.UECollectionView?.backgroundColor = UIColor.white
        self.UECollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIDUI)
        
        
        RCCollectionView.delegate = self
        RCCollectionView.dataSource = self
        UECollectionView.delegate = self
        UECollectionView.dataSource = self
        
        // Prefetch data
        if #available(iOS 10.0, *) {
            RCCollectionView.prefetchDataSource = self
            UECollectionView.prefetchDataSource = self
        } else {
            // Fallback on earlier versions
        }
        
        // Labels
        setupLabels()
        
        subjectsTableView.dataSource = self
        subjectsTableView.delegate = self
        
        subjectsTableView.register(SubjectsViewCell.self, forCellReuseIdentifier: cellIDSubjects)
        UECollectionView.register(EventsViewCell.self, forCellWithReuseIdentifier: cellIDUI)
        RCCollectionView.register(Courses.self, forCellWithReuseIdentifier: cellIDRC)
    }
    
    func setupLabels(){
        recommendedCoursesLabel.textColor = UIColor(red: 0.416, green: 0.463, blue: 0.455, alpha: 1)
        recommendedCoursesLabel.font = UIFont(name: "Roboto-Medium", size: 16)
        recommendedCoursesLabel.font = recommendedCoursesLabel.font.withSize(16)
    }
    
    func fetchCourses(){
        coursesRef.getDocuments {
            (snapshot, _) in
            self.coursesList = try! snapshot!.decoded()
            self.coursesList.forEach(
                {
                    print($0)
            })
            self.RCCollectionView.reloadData()
        }
        
        images = [#imageLiteral(resourceName: "reco-image"), #imageLiteral(resourceName: "img-stroke-imaging") ,#imageLiteral(resourceName: "img-colon-canc") , #imageLiteral(resourceName: "img-tuberc")]
    }
    
    func fetchEvents(){
        eventsRef.getDocuments {
            (snapshot, _) in
            self.eventsList = try! snapshot!.decoded()
            self.eventsList.forEach(
                {
                    print($0)
            })
            self.UECollectionView.reloadData()
        }
    }
    
  
}

/* CollectionView Data Source */

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDataSourcePrefetching{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == RCCollectionView){
            return self.coursesList.count
        }else{
            return self.eventsList.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(collectionView == RCCollectionView){
              let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: cellIDRC, for: indexPath) as! Courses
            
            cell.backgroundColor = UIColor.white
            cell.image = images[indexPath.row]
            
            cell.configure(with : coursesList[indexPath.row])
            
            return cell
        }else{
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: cellIDUI, for: indexPath) as! EventsViewCell
            cell.backgroundColor = UIColor.white
            
            cell.configure(with: eventsList[indexPath.row])
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat((collectionView.frame.size.width / 3) - 20), height: CGFloat(127))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
            // Begin asynchronously fetching data for the requested index paths.

    }
    func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
        
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
        
        // cell.containingViewController = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let subjects = Constants.Subjects.subjectsList
        let selectedSubject = subjects[indexPath.row]
        let destinationVC = (UIStoryboard(name: "Main",bundle: nil).instantiateViewController(withIdentifier: "SubjectVC") as? SubjectViewController)!
        destinationVC.subject = selectedSubject
        print(selectedSubject)
        self.navigationController?.pushViewController(destinationVC, animated: true)
        // destinationVC.performSegue(withIdentifier: "showSubject", sender: self)
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

