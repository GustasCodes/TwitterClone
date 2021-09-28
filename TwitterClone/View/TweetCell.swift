//
//  TweetCell.swift
//  TwitterClone
//
//  Created by Gustas on 2021-09-28.
//

import UIKit
import Kingfisher

class TweetCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var tweet: Tweet? {
        didSet {
            configureCellData()
        }
    }
    
    private let profileImage: UIImageView = {
        let profileImageView = UIImageView()
        profileImageView.backgroundColor = .systemBackground
        profileImageView.setDimensions(width: 48, height: 48)
        profileImageView.layer.cornerRadius = 48 / 2
        profileImageView.clipsToBounds = true
        
        return profileImageView
    }()
    
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = .textPrimary
        return label
    }()
    
    private let infoLabel = UILabel()
    
    private var commentButon: UIButton = {
        let button = Utilities().tweetCellButton(image: UIImage(named: "comment")!)
        button.addTarget(self, action: #selector(handleCommentTap), for: .touchUpInside)
        return button
    }()
    
    private var retweetButon: UIButton = {
        let button = Utilities().tweetCellButton(image: UIImage(named: "retweet")!)
        button.addTarget(self, action: #selector(handleCommentTap), for: .touchUpInside)
        return button
    }()
    
    private var likeButon: UIButton = {
        let button = Utilities().tweetCellButton(image: UIImage(named: "like_unselected")!)
        button.addTarget(self, action: #selector(handleCommentTap), for: .touchUpInside)
        return button
    }()
    
    private var shareButton: UIButton = {
        let button = Utilities().tweetCellButton(image: UIImage(named: "share")!)
        button.addTarget(self, action: #selector(handleCommentTap), for: .touchUpInside)
        return button
    }()
    
    // mark: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        
        addSubview(profileImage)
        profileImage.anchor(top: topAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
        
        let stack = UIStackView(arrangedSubviews: [infoLabel, captionLabel])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 4
        
        addSubview(stack)
        stack.anchor(top: profileImage.topAnchor, left: profileImage.rightAnchor, paddingTop: 12, paddingLeft: 12)
        
        let actionStack = UIStackView(arrangedSubviews: [commentButon, retweetButon, likeButon, shareButton])
        actionStack.axis = .horizontal
        actionStack.distribution = .fillEqually
        actionStack.spacing = 72
        addSubview(actionStack)
        actionStack.centerX(inView: self)
        actionStack.anchor(bottom: bottomAnchor, paddingBottom: 8)
        
        let underlineView = UIView()
        underlineView.backgroundColor = .separator
        addSubview(underlineView)
        underlineView.anchor(left: leftAnchor, right: rightAnchor, height: 0.7)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func handleCommentTap() {
        
    }
    
    // MARK: - Helpers
    
    func configureCellData() {
        guard let tweet = self.tweet else { return }
        
        // TODO: - Need help refactoring this part below
        UserService.shared.fetchUser(uid: tweet.userUid) { (user) in
            let viewModel = TweetViewModel(tweet: tweet, user: user)
            self.infoLabel.attributedText = viewModel.userInfoText
            self.profileImage.kf.setImage(with: URL(string: user.profileImageUrl))
        }
        
        captionLabel.text = tweet.caption
    }
}
