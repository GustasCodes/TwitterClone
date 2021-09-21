//
//  FeedController.swift
//  TwitterClone
//
//  Created by Gustas on 2021-07-29.
//

import UIKit
import Kingfisher

class FeedController: UIViewController {
    
    // MARK: - Properties
    
    var user: User? {
        didSet {
            configureLeftBarButton()
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        
        let imageView = UIImageView(image: UIImage(named: "icons8-twitter-30"))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
    
    func configureLeftBarButton() {
        guard let user = user else { return }
        guard let profileImageUrl = URL(string: user.profileImageUrl) else { return }
        let profileImageView = UIImageView()
        let url = profileImageUrl
        profileImageView.kf.setImage(with: url)
        profileImageView.setDimensions(width: 32, height: 32)
        profileImageView.layer.cornerRadius = 32 / 2
        profileImageView.clipsToBounds = true
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView)
    }
}
