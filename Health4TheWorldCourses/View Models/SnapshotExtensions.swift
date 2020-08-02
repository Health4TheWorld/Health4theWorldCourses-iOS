//
//  QuerySnapshot.swift
//  Health4TheWorldCourses
//
//  Created by Premnath Ramanathan on 7/26/20.
//  Copyright © 2020 Health4TheWorld. All rights reserved.
//

import Foundation
import FirebaseFirestore

extension QueryDocumentSnapshot {
    func decoded<Type: Decodable>() throws -> Type {
        let jsonData =  try JSONSerialization.data(withJSONObject: data(), options: [])
        let object = try JSONDecoder().decode(Type.self, from: jsonData)
        return object
    }
}

extension QuerySnapshot {
    func decoded<Type: Decodable>() throws -> [Type] {
        let objects: [Type] = try documents.map({
            try $0.decoded()
        })
        return objects
    }
}
