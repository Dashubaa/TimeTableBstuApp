//
//  FirebaseManager.swift
//  TimeTableAppStart
//
//  Created by Дарья Шубич on 28.11.23.
//

import Foundation
import Firebase

class FirebaseManager {
    
    func registrateNewUser(user: UserData) {
        Auth.auth().createUser(withEmail: user.email, password: user.password) {result, err in
            guard err == nil else {
                print(err?.localizedDescription)
                return
            }
            
            if let uid = result?.user.uid {
                Firestore.firestore()
                    .collection("users")
                    .document(uid)
                    .setData([
                        "name": user.name,
                        "email": user.email,
                        "group": user.group ?? "No group",
                        "isStudent": user.isStudent
                    ], merge: true) { err in
                        print("saved")
                    }
            }
            
        }
        
    }
    
    func fetchGroups(completion: @escaping ([Group]) -> Void){
        let db = Firestore.firestore()
        let groupCollection = db.collection("groups")
        
        groupCollection.getDocuments{ snapshot, error in
            if let error = error {
                print("Error fetching groups: \(error.localizedDescription)")
                completion([])
            } else {
                let groups = snapshot?.documents.map { document -> Group in
                    let data = document.data()
                    let id = document.documentID
                    let name = data["name"] as? String ?? ""
                    return Group(id: id, name: name)
                }
                completion(groups ?? [])
            }
        }
    }
    
}

struct UserData {
    var name: String
    var email: String
    var password: String
    var group: String?
    var isStudent: Bool
}

struct Group: Identifiable {
    var id: String
    var name: String
}
