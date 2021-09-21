//
//  AuthService.swift
//  TwitterClone
//
//  Created by Gustas on 2021-09-21.
//

import Firebase
import FirebaseFirestoreSwift

struct AuthService {
    static let shared = AuthService()
    
    func login(withEmail email: String, password: String, completion: @escaping() -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            
            completion()
        }
    }
    
    func register(email: String, password: String, fullname: String, username: String, completion: @escaping () -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let user = result?.user else { return }
            
            let data = ["email": email,
                        "username": username,
                        "fullname": fullname,
                        "profileImageUrl": DEFAULT_PROFILE_IMAGE,
                        "uid": user.uid]
            
            COLLECTION_USERS.document(user.uid).setData(data) { (_) in
                completion()
            }
        }
    }
}
