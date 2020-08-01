//
//  App.swift
//  Health4TheWorldCourses
//
//  Created by Premnath Ramanathan on 7/25/20.
//  Copyright © 2020 Health4TheWorld. All rights reserved.
//

import Foundation
import FirebaseFirestoreSwift

struct CoursesModel: Identifiable, Codable{
    @DocumentID var id: String? = UUID().uuidString
    var author: String
    var description: String
    var reviews: Int
    var segue: String
    var title: String
    
    enum CodingKeys: String, CodingKey{
        case author
        case description
        case reviews
        case segue
        case title
    }
}
