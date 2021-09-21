//
//  ConversationController.swift
//  TwitterClone
//
//  Created by Gustas on 2021-07-29.
//

import UIKit

class ConversationController: UIViewController {
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "Messages"
    }
}
