//
//  CoursesViewModel.swift
//  Health4TheWorldCourses
//
//  Created by Premnath Ramanathan on 7/25/20.
//  Copyright © 2020 Health4TheWorld. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

@available(iOS 13.0, *)
class CoursesViewModel: ObservableObject{
    @Published var courses = [CoursesModel]()
    
    private var db = Firestore.firestore()
    
    func fetchData(){
        db.collection(Constants.DBCollections.courses).addSnapshotListener{
            (QuerySnapshot, error) in
            guard let documents = QuerySnapshot?.documents else{
                print("No documents")
                return
            }
            
            self.courses = documents.compactMap({ (queryDocumentSnapshot) -> CoursesModel? in
                return try? queryDocumentSnapshot.data(as: CoursesModel.self)
            })
        }
    }
}
