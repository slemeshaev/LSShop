//
//  AbstractErrorParser.swift
//  LSShop
//
//  Created by Станислав Лемешаев on 22.12.2020.
//

import Alamofire

protocol AbstractErrorParser {
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
