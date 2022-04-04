//
//  ExchangeServiceTestCase.swift
//  BaluchonTests
//
//  Created by Reda on 24/03/2022.
//

@testable import Baluchon

import XCTest

class ExchangeServiceTestCase: XCTestCase {


        func testGetExchangeShouldPostFailedCallbackIfError() {
            // Given
            let exchange = ExchangeService.shared
            exchange.session = URLSessionFake(data: nil, error: FakeResponseDate.error, response: nil)
           
            // When
            let expectation = XCTestExpectation(description: "Wait for queue change.")
            exchange.getRate{(data, success)in
            
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(data)
            expectation.fulfill()
            }
            wait(for: [expectation], timeout: 1)
        }
        
        func testGetExchangeShouldPostFailedCallbackIfNoData() {
            // Given
            let exchange = ExchangeService.shared
            exchange.session = URLSessionFake(data: nil, error: nil, response: nil)
           
            // When
            let expectation = XCTestExpectation(description: "Wait for queue change.")
            exchange.getRate{(data, success)in
            
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(data)
            expectation.fulfill()
            }
            wait(for: [expectation], timeout: 5)
            
        }

        
        
        func testGetExchangeShouldPostFailedCallbackIfIncorrectResponse() {
            // Given
            let exchange = ExchangeService.shared
            exchange.session = URLSessionFake(data: FakeResponseDate().correctExchangeData, error: nil, response: FakeResponseDate().responseKO)
           
            // When
            let expectation = XCTestExpectation(description: "Wait for queue change.")
            exchange.getRate {(data, success)in
            
            // Then

            XCTAssertTrue(success)
            XCTAssertNotNil(data)
            expectation.fulfill()
            }
            wait(for: [expectation], timeout: 5)
        }
        
        func testGetExchangeShouldPostFailedCallbackIfIncorrectData() {
            
            // Given
            let exchange = ExchangeService.shared
            exchange.session = URLSessionFake(data: FakeResponseDate().incorrectData, error: nil, response: FakeResponseDate().responseOK)
           
            // When
            let expectation = XCTestExpectation(description: "Wait for queue change.")
            exchange.getRate {(data, success)in
            
            // Then
            XCTAssertTrue(success)
            XCTAssertNil(data)
            expectation.fulfill()
            }
            wait(for: [expectation], timeout: 2)
        }
        
        func testExchangeQuoteShouldPostSuccessCallbackIfNoErrorAndCorrectData() {
    
            // Given
            let exchange = ExchangeService.shared
            exchange.session = URLSessionFake(data: FakeResponseDate().correctExchangeData, error: nil, response: FakeResponseDate().responseOK)
            
            // When
            let expectation = XCTestExpectation(description: "Wait for queue change.")
            exchange.getRate {(succes,data)in
            
            // Then
            XCTAssertTrue((succes != nil))
            XCTAssertNotNil(data)
                
                
            
                
            expectation.fulfill()
            }
            wait(for: [expectation], timeout: 0.01)
        }
    }



