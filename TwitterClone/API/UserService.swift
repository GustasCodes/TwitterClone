//
//  UserService.swift
//  TwitterClone
//
//  Created by Gustas on 2021-09-21.
//

import Firebase

struct UserService {
    static let shared = UserService()
    
    func fetchUser(completion: @escaping(User) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        COLLECTION_USERS.document(uid).getDocument { (snapshot, _) in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            completion(user)
        }
    }
}
