//
//  RegistrationController.swift
//  TwitterClone
//
//  Created by Gustas on 2021-07-29.
//

import UIKit

class RegistrationController: UIViewController {
    // MARK: - Properties
    
    private let signupButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .twitterBlue
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.textPrimary, for: .normal)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.addTarget(self, action: #selector(registerNewUser), for: .touchUpInside)
        return button
    }()
    
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(named: "icons8-twitter-30")
        iv.tintColor = UIColor(named: "LightAndDarkHeaderColor")
        return iv
    }()
    
    private let navigateBackButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .systemBackground
        
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .regular)
        button.setImage(UIImage(systemName: "chevron.left", withConfiguration: imageConfig), for: .normal)
        button.tintColor = .twitterBlue
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.addTarget(self, action: #selector(navigateToLoginView), for: .touchUpInside)
        return button
    }()
    
    private let titleText: UILabel = {
       let label = UILabel()
        label.text = "Create your account"
        label.font = UIFont.systemFont(ofSize: 20, weight: .black)
        label.tintColor = .textPrimary
        return label
    }()
    
    private lazy var usernameContainerView: UIView = {
        let view = Utilities().inputContainerView(textField: usernameTextField)
        return view
    }()
    
    private lazy var nameContainerView: UIView = {
        let view = Utilities().inputContainerView(textField: nameTextField)
        return view
    }()
    
    private lazy var emailContainerView: UIView = {
        let view = Utilities().inputContainerView(textField: emailTextField)
        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        let view = Utilities().inputContainerView(textField: passwordTextField)
        return view
    }()
    
    private let usernameTextField = Utilities().textField(withPlaceholder: "Username")
    
    private let nameTextField = Utilities().textField(withPlaceholder: "Full Name")
    
    private let emailTextField = Utilities().textField(withPlaceholder: "Email")
    
    private let passwordTextField: UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    // MARK: - Selectors
    
    @objc func navigateToLoginView() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func registerNewUser() {
        
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(logoImageView)
        logoImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor, paddingTop: 0)
        
        view.addSubview(navigateBackButton)
        navigateBackButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingLeft: 16)
        
        view.addSubview(titleText)
        titleText.anchor(top: navigateBackButton.bottomAnchor, paddingTop: 32)
        titleText.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, nameContainerView, usernameContainerView])
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillEqually
        
        view.addSubview(stack)
        stack.anchor(top: titleText.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(signupButton)
        signupButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingRight: 16)
        signupButton.setDimensions(width: 90, height: 40)
    }
}
