//
//  RegistrationViewModel.swift
//  LSShop
//
//  Created by Станислав Лемешаев on 27.12.2020.
//

struct RegistrationViewModel: AuthenticationProtocol {
    var email: String?
    var password: String?
    var fullName: String?
    var userName: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false
            && password?.isEmpty == false
            && fullName?.isEmpty == false
            && userName?.isEmpty == false
    }
}
