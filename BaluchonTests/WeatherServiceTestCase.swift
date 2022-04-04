//
//  WeatherServiceTestCase.swift
//  BaluchonTests
//
//  Created by Reda on 25/03/2022.
//

@testable import Baluchon

import XCTest

class WeatherServiceTestCase: XCTestCase {

    func testGetExchangeShouldPostFailedCallbackIfError() {
        // Given
        let weather = HaveWeather.shared
        weather.session = URLSessionFake(data: nil, error: FakeResponseDate.error, response: nil)
       
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        weather.weather(city:"erreur") { (success, data, error) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(data)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 9)
        
       
        }
      
    
    
    func testGetExchangeShouldPostFailedCallbackIfNoData() {
        // Given
        let weather = HaveWeather.shared
        weather.session = URLSessionFake(data: nil, error: nil, response: nil)
       
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        weather.weather(city:""){(success, data, error)in
        
        // Then
        XCTAssertFalse(success)
        XCTAssertNil(data)
        expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
        
    }

    
    
    func testGetExchangeShouldPostFailedCallbackIfIncorrectResponse() {
        // Given
        let weather = HaveWeather.shared
        weather.session = URLSessionFake(data: FakeResponseDate().correctWeatherData, error: nil, response: FakeResponseDate().responseKO)
       
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        weather.weather(city:"Toulon") {(success, data, error)in
        
        // Then

        XCTAssertTrue(success)
        XCTAssertNotNil(data)
        expectation.fulfill()
        }
        wait(for: [expectation], timeout: 7)
    }
    
    func testGetExchangeShouldPostFailedCallbackIfIncorrectData() {
        
        // Given
        let weather = HaveWeather.shared
        weather.session = URLSessionFake(data: FakeResponseDate().incorrectData, error: nil, response: FakeResponseDate().responseOK)
       
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        weather.weather(city:"Toulon") {(success, data, error)in
        
        // Then
        XCTAssertFalse(success)
        XCTAssertNil(data)
        expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func testExchangeQuoteShouldPostSuccessCallbackIfNoErrorAndCorrectData() {

        // Given
        let weather = HaveWeather.shared
        weather.session = URLSessionFake(data: FakeResponseDate().correctWeatherData, error: nil, response: FakeResponseDate().responseOK)
        
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        weather.weather(city:"Toulon") {(succes, data, error)in
        
        // Then
        XCTAssertTrue((succes != nil))
        XCTAssertNotNil(data)
        expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
}






