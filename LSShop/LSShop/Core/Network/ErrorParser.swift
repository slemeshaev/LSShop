//
//  ErrorParser.swift
//  LSShop
//
//  Created by Станислав Лемешаев on 22.12.2020.
//

import Alamofire

class ErrorParser: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return result
    }
    
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}

