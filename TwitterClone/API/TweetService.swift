//
//  TweetService.swift
//  TwitterClone
//
//  Created by Gustas on 2021-09-21.
//

import Firebase
import FirebaseFirestoreSwift

struct TweetService {
    static let shared = TweetService()
    
    func postTweet(caption: String, completion: ((Error?) -> Void)?) {
        guard let user = Auth.auth().currentUser else { return }
        
        let data = ["userUid": user.uid,
                    "caption": caption,
                    "likes": 0,
                    "retweets": 0,
                    "timestamp": Timestamp(date: Date())] as [String : Any]
        
        COLLECTION_TWEETS.addDocument(data: data, completion: completion)
    }
    
    func fetchTweets() {
        // TODO: - Fetch tweets from Firebase and display for users
    }
}
