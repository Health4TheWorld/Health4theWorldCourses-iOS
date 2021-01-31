//
//  SubjectViewController.swift
//  Health4TheWorldCourses
//
//  Created by Patrick Botros on 1/30/21.
//  Copyright © 2021 Health4TheWorld. All rights reserved.
//

import UIKit

class SubjectViewController: UIViewController {

    var subject: String?
    @IBOutlet weak var subjectThumbnail: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "hello"
        self.tabBarController?.navigationItem.title = subject
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
