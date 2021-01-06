//
//  AuthRequestFactory.swift
//  LSShop
//
//  Created by Станислав Лемешаев on 23.12.2020.
//

import Alamofire

protocol AuthRequestFactory {
    func login(username: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
}
