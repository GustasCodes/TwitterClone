//
//  ExploreController.swift
//  TwitterClone
//
//  Created by Gustas on 2021-07-29.
//

import UIKit

class ExploreController: UIViewController {
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Explore"
    }
}
