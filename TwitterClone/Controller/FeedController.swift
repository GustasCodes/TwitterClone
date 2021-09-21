//
//  FeedController.swift
//  TwitterClone
//
//  Created by Gustas on 2021-07-29.
//

import UIKit

class FeedController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        
        let imageView = UIImageView(image: UIImage(named: "icons8-twitter-30"))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
}
