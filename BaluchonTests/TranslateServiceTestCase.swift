//
//  TranslateServiceTestCase.swift
//  BaluchonTests
//
//  Created by Reda on 23/03/2022.
//



@testable import Baluchon

import XCTest

class TranslateServiceTestCase: XCTestCase {

    func testGetTranslationShouldPostFailedCallbackIfError() {
        // Given
        let translate = TranslateService(session:URLSessionFake(data:nil, error: FakeResponseDate.error, response:nil))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        translate.getTranslate(text:nil) {(data, success)in
        
        // Then
        XCTAssertFalse(success)
        XCTAssertNil(data)
        expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    
    func testGetTranslationShouldPostFailedCallbackIfNoData() {
        // Given
        let translate = TranslateService(session:URLSessionFake(data:nil, error:nil, response:nil))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        translate.getTranslate(text: nil) {(data, success)in
        
        // Then
        XCTAssertFalse(success)
        XCTAssertNil(data)
        expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
        
    }

    
    
    func testGetTranslationShouldPostFailedCallbackIfIncorrectResponse() {
        // Given
        let translate = TranslateService(session:URLSessionFake(data:FakeResponseDate().correctTranslateData, error:nil, response:FakeResponseDate().responseKO))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        translate.getTranslate(text: nil) {(data, success)in
        
        // Then

        XCTAssertTrue(success)
        XCTAssertNotNil(data)
        expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetTranslationShouldPostFailedCallbackIfIncorrectData() {
        
        // Given
        let translate = TranslateService(session:URLSessionFake(data:FakeResponseDate().incorrectData, error:nil, response:FakeResponseDate().responseOK))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        translate.getTranslate(text: nil) {(data, success)in
        
        // Then
        XCTAssertFalse(success)
        XCTAssertNil(data)
        expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testTranslationQuoteShouldPostSuccessCallbackIfNoErrorAndCorrectData() {
        let translatedText = "the big tower"
        // Given
        let translate = TranslateService(session:URLSessionFake(data:FakeResponseDate().correctTranslateData, error:nil, response:FakeResponseDate().responseOK))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        translate.getTranslate(text:translatedText) {(succes,data)in
        
        // Then
        XCTAssertTrue((succes != nil))
        XCTAssertNotNil(data)
            
            
        
            
        expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
}
