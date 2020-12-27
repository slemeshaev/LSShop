//
//  ShopperViewModel.swift
//  LSShop
//
//  Created by Станислав Лемешаев on 27.12.2020.
//

struct ShopperViewModel: AuthenticationProtocol {
    var userName: String?
    var password: String?
    var email: String?
    
    var formIsValid: Bool {
        return userName?.isEmpty == false
            && password?.isEmpty == false
            && email?.isEmpty == false
    }
}
