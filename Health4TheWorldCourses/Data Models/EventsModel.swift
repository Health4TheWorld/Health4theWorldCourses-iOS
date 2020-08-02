//
//  EventsModel.swift
//  Health4TheWorldCourses
//
//  Created by Premnath Ramanathan on 8/1/20.
//  Copyright © 2020 Health4TheWorld. All rights reserved.
//

import Foundation
import FirebaseFirestoreSwift

struct EventsModel: Identifiable, Codable{
    @DocumentID var id: String? = UUID().uuidString
    var author: String
    var date: String
    var place: String
    var time: String
    var title: String
    
    enum CodingKeys: String, CodingKey{
        case author
        case date
        case place
        case time
        case title
    }
}
