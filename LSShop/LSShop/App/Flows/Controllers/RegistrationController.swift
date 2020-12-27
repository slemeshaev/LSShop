//
//  RegistrationController.swift
//  LSShop
//
//  Created by Станислав Лемешаев on 23.12.2020.
//

import UIKit

class RegistrationController: UIViewController {
    
    // MARK: - Properties
    
    private var viewModel = RegistrationViewModel()
    
    // - iconImage
    private let iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "cart")
        imageView.tintColor = .white
        return imageView
    }()
    
    // - emailContainerView
    private lazy var emailContainerView: UIView = {
        return InputContainerView(image: UIImage(systemName: "envelope"),
                                  textField: emailTextField)
    }()
    private let emailTextField = CustomTextField(placeholder: "Email")
    
    // - fullNameContainerView
    private lazy var fullNameContainerView: UIView = {
        return InputContainerView(image: UIImage(systemName: "person"),
                                  textField: fullNameTextField)
    }()
    private let fullNameTextField = CustomTextField(placeholder: "Полное имя")
    
    // - userNameContainerView
    private lazy var userNameContainerView: UIView = {
        return InputContainerView(image: UIImage(systemName: "person"),
                                  textField: userNameTextField)
    }()
    
    // - userNameTextField
    private let userNameTextField = CustomTextField(placeholder: "Имя пользователя")
    private lazy var passwordContainerView: InputContainerView = {
        return InputContainerView(image: UIImage(systemName: "lock"),
                                  textField: passwordTextField)
    }()
    
    private let passwordTextField: UITextField = {
        let textField = CustomTextField(placeholder: "Пароль")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    // - signUpButton
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Зарегистрироваться", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleSignUpButton), for: .touchUpInside)
        button.setHeight(height: 50)
        button.isEnabled = false
        return button
    }()
    
    // - alreadyHaveAccountButton
    private let alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Уже есть учетная запись? ",
                                                        attributes: [.font: UIFont.systemFont(ofSize: 16),
                                                                     .foregroundColor: UIColor.white])
        attributedTitle.append(NSAttributedString(string: "Войти",
                                                  attributes: [.font: UIFont.boldSystemFont(ofSize: 16),
                                                               .foregroundColor: UIColor.white]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleShowSignIn), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNotificationObservers()
    }
    
    // MARK: - Selectors
    @objc func textDidChange(sender: UITextField) {
        if sender == emailTextField {
            viewModel.email = sender.text
        } else if sender == passwordTextField {
            viewModel.password = sender.text
        } else if sender == fullNameTextField {
            viewModel.fullName = sender.text
        } else if sender == userNameTextField{
            viewModel.userName = sender.text
        }
        
        checkFormStatus()
    }
    
    @objc func handleSignUpButton() {
        print(#function)
    }
    
    @objc func handleShowSignIn() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Helpers
    func configureUI() {
        configureGradientLayer()
        
        view.addSubview(iconImage)
        
        iconImage.centerX(inView: view)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        iconImage.setDimensions(height: 120, width: 140)
        
        let stackView = UIStackView(arrangedSubviews: [emailContainerView,
                                                       passwordContainerView,
                                                       fullNameContainerView,
                                                       userNameContainerView,
                                                       signUpButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        
        view.addSubview(stackView)
        
        stackView.anchor(top: iconImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
                         paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor,
                                        paddingLeft: 32, paddingBottom: 16, paddingRight: 32)
    }
    
    func configureNotificationObservers() {
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        fullNameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        userNameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
}

// MARK: - AuthenticationControllerProtocol
extension RegistrationController: AuthenticationControllerProtocol {
    // проверка состояния формы
    func checkFormStatus() {
        if viewModel.formIsValid {
            signUpButton.isEnabled = true
            signUpButton.backgroundColor = #colorLiteral(red: 0, green: 0.3869185929, blue: 0.7568627596, alpha: 1)
        } else {
            signUpButton.isEnabled = false
            signUpButton.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        }
    }
}

