//
//  ResponseCodableTests.swift
//  LSShopTests
//
//  Created by Станислав Лемешаев on 28.12.2020.
//

import XCTest
import Alamofire

class ResponseCodableTests: XCTestCase {
    
    struct PostStub: Codable {
        let userId: Int
        let id: Int
        let title: String
        let body: String
    }

    enum ApiErrorStub: Error {
        case fatalError
    }

    // почему-то здесь ошибка
    struct ErrorParserStub: AbstractErrorParser {
        func parse(_ result: Error) -> Error {
            return ApiErrorStub.fatalError
        }
        
        func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
            return error
        }
    }
    
    let expectation = XCTestExpectation(description: "https://jsonplaceholder.typicode.com/posts/1")
    var errorParser: ErrorParserStub!

    override func setUp() {
        super.setUp()
        errorParser = ErrorParserStub()
    }
    
    override func tearDown() {
        super.tearDown()
        errorParser = nil
    }

    // и здесь ошибка
    func testShouldDownloadAndParse() {
        let errorParser = ErrorParserStub()
        
        AF.request("https://jsonplaceholder.typicode.com/posts/1").responseCodable(errorParser: errorParser) {(response: DataResponse<PostStub>) in
            switch response.result {
            case .success(_): break
            case .failure:
                XCTFail()
            }
        }
    }

}
