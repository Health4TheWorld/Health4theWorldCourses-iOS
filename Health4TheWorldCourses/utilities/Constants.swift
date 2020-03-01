//
//  Constants.swift
//  Health4TheWorldCourses
//
//  Created by Premnath Ramanathan on 3/1/20.
//  Copyright © 2020 Health4TheWorld. All rights reserved.
//

import Foundation

enum Constants{
    
    enum DBCollections{
        static let courses: String = "courses"
        static let users : String = "users"
        static let authors : String =  "authors"
        
    }

    enum Profile {
        static let section1 : [String] =  [ "Completed Quizzes & Certificates","Statistics"]
        static let section1Segue : [String] =  ["CompletedQuizzes","Statistics"]
        static let section2 : [String] = ["Edit my profile","Choose Language", "Account Security & Privacy"]
        static let section2Segue : [String] =  [ "EditProfile","Language","Security&Privacy"]
        static let section3 : [String] = ["Report a problem", "Contact us","About H4TW"]
        static let section3Segue : [String] =  ["ReportProblem","ContactUs","AboutH4TW"]
        static let profileItems: [[String]] = [section1,section2,section3]
        static let segueLinks: [[String]] = [section1Segue,section2Segue,section3Segue]
        
        static let headers : [String] = ["My Achievement", "Account Settings", "Support"]
    }
    
    enum Subjects {
        static let subjectsList: [String] =  ["Cardiology","Infectious Disease","Oncology","Obstetrics & Gynecology","Pulmonology"]
        static let segueLinks: [String] = ["Cardiology","Infectious Disease","Oncology","Obstetrics & Gynecology","Pulmonology"]
        
       static let icons = ["Cardiology","Infectious", "Oncology","ute","lungs","Surgery"]
    }
    
    enum Events {
        static let events: [String] =  [""]
        static let segueLinks : [String] =  [""]
    }
    
    enum Courses {
         static let title: String = "title"
         static let author: String = "author"
         static let description: String = "description"
         static let reviews: String = "reviews"
         static let segue: String = "segue"
    }
    
    /* Profile VC */
     
    
    /* Cell ReUse IDs **/
    enum cellIDs {
        static let cellIDRC: String = "Courses"
        static let cellIDUI: String = "Events"
        static let cellIDSubjects: String = "Subjects"
        
        //Profile
        static let cellIDProfile: String = "ProfileCell"
    }
    
    /* View Titles **/
    enum titles {
        static let home: String = "Home"
    }
}
