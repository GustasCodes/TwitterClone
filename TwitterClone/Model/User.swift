//
//  User.swift
//  TwitterClone
//
//  Created by Gustas on 2021-09-21.
//

import Firebase
import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    let username: String
    let email: String
    let profileImageUrl: String
    let fullname: String
    @DocumentID var id: String?
}
