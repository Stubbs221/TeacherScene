//
//  APIManager.swift
//  TeacherScene
//
//  Created by Vasily Maslov on 27.09.2022.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage

class APIManager {
    
    static let shared = APIManager()
    
    private func configureFB() -> Firestore {
        var db: Firestore!
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        return db
    }
    
    func getPost(collection: String, dataName: String, completion: @escaping (DataModel?) -> Void) {
        let db = configureFB()
        db.collection(collection).document(dataName).getDocument(completion: { (document, error) in
            guard error == nil else { completion(nil); return }
            let data = DataModel(field1: document?.get("field1") as! String, field2: document?.get("field2") as! String)
            completion(data)
        })
    }
    
    
}
