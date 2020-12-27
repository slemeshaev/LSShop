//
//  LoginViewModel.swift
//  LSShop
//
//  Created by Станислав Лемешаев on 27.12.2020.
//

struct LoginViewModel: AuthenticationProtocol {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
}

