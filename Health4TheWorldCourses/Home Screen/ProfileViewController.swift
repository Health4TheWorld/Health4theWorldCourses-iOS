//
//  ViewController.swift
//  Health4TheWorldCourses
//
//  Created by Premnath Ramanathan on 2/12/20.
//  Copyright © 2020 Health4TheWorld. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var SignInButton: UIButton!
    @IBOutlet weak var profileIcon: UIImageView!
    @IBOutlet weak var profileTableView: UITableView!
    
     var cellID = "ProfileCell"
    
    var headers = ["My Achievement", "Account Settings", "Support"]
    
    var tableItems = [
        ProfileStruct(ProfileItems: [ "Completed Quizzes & Certificates","Statistics"], segueLinks: ["CompletedQuizzes","Statistics"])
       ,
        ProfileStruct(ProfileItems: ["Edit my profile","Choose Language", "Account Security & Privacy"], segueLinks: ["EditProfile","Language","Security&Privacy"])
    ,
         ProfileStruct(ProfileItems:  ["Report a problem", "Contact us","About H4TW"], segueLinks: ["ReportProblem","ContactUs","AboutH4TW"])
   
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    profileTableView.register(ProfileCell.self, forCellReuseIdentifier: cellID)
        
    }

    @IBAction func SignInTapped(_ sender: Any) {
        //Navigate to Sign In page
        print("Sign In Tapped")
    }
    
    /* UI Table View protocol implementation*/

    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let label = UILabel()
        
        sectionLabels(label, section)
        
        return label
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableItems[section].ProfileItems.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableItems.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ProfileCell
        
       let item = tableItems[indexPath.section].ProfileItems[indexPath.row]
      
        cell.itemView.text = item
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("selected segue: ", tableItems [indexPath.section].segueLinks[indexPath.row])
        
        performSegue(withIdentifier: tableItems [indexPath.section].segueLinks[indexPath.row], sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let destination = segue.destination as? AboutUsVC {
                destination.vcTitle = "About H4TW"
                profileTableView.deselectRow(at: profileTableView.indexPathForSelectedRow!, animated: true)
            }
    }
    
    /* Helper functions */
    
    
    fileprivate func sectionLabels(_ label: UILabel, _ section: Int) {
        label.frame = CGRect(x: 0, y: 0, width: 129, height: 19)
        label.backgroundColor = .white
        label.textColor = UIColor(red: 0.216, green: 0.271, blue: 0.267, alpha: 1)
        
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        
        label.text = headers[section]
    }
    
}

