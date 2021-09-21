//
//  UploadTweetController.swift
//  TwitterClone
//
//  Created by Gustas on 2021-09-21.
//

import UIKit
import Kingfisher

class UploadTweetController: UIViewController {
    
    // MARK: - Properties
    
    private let user: User
    
    private let tweetButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .twitterBlue
        button.setTitle("Tweet", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.setDimensions(width: 60, height: 25)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(uploadTweet), for: .touchUpInside)
        return button
    }()
    
    private let profileImage: UIImageView = {
        let profileImageView = UIImageView()
        profileImageView.backgroundColor = .systemBackground
        profileImageView.setDimensions(width: 32, height: 32)
        profileImageView.layer.cornerRadius = 32 / 2
        profileImageView.clipsToBounds = true
        
        return profileImageView
    }()
    
    private let captionTextView = CaptionTextView()
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Selectors
    
    @objc func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func uploadTweet() {
        if captionTextView.text != "" {
            TweetService.shared.postTweet(caption: captionTextView.text) { (error) in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    // MARK: - API
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        configureNavigationBar()
        
        view.addSubview(profileImage)
        profileImage.anchor(top: self.view.topAnchor, left: self.view.leftAnchor, paddingTop: 16, paddingLeft: 16)
        let profileImageUrl = URL(string: user.profileImageUrl)
        profileImage.kf.setImage(with: profileImageUrl)
        
        view.addSubview(captionTextView)
        captionTextView.anchor(top: self.view.topAnchor, left: profileImage.rightAnchor, bottom: self.view.safeAreaLayoutGuide.bottomAnchor, right: self.view.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 16, paddingRight: 16)
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .systemBackground
        navigationController?.navigationBar.isTranslucent = false
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissView))
        navigationItem.leftBarButtonItem?.tintColor = .textPrimary
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: tweetButton)
    }
}
