//
//  Protocols.swift
//  LSShop
//
//  Created by Станислав Лемешаев on 27.12.2020.
//

protocol AuthenticationProtocol {
    var formIsValid: Bool { get }
}

protocol AuthenticationControllerProtocol {
    func checkFormStatus()
}
