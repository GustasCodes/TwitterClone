//
//  Tweet.swift
//  TwitterClone
//
//  Created by Gustas on 2021-09-21.
//

import Firebase
import FirebaseFirestoreSwift

struct Tweet: Identifiable, Decodable {
    @DocumentID var id: String?
    let userUid: String
    let caption: String
    let likes: Int
    let retweets: Int
    let timestamp: Timestamp
    
    var user: User?
}
