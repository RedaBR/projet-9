//
//  FakeResponseData.swift
//  BaluchonTests
//
//  Created by Reda on 23/03/2022.
//

import Foundation
class FakeResponseDate {
    
//MARK : - Data
    
    var correctTranslateData : Data {
        let bundle = Bundle.init(for: FakeResponseDate.self)
        let url = bundle.url(forResource: "Translate", withExtension: "json")
        let data = try? Data(contentsOf: url!)
        return data!
    }
    var correctExchangeData : Data {
        let bundle = Bundle.init(for: FakeResponseDate.self)
        let url = bundle.url(forResource: "Exchange", withExtension: "json")
        let data = try? Data(contentsOf: url!)
        return data!
    }
    
    var correctWeatherData : Data {
        let bundle = Bundle.init(for: FakeResponseDate.self)
        let url = bundle.url(forResource: "Weather", withExtension: "json")
        let data = try? Data(contentsOf: url!)
        return data!
    }

    let incorrectData = "erreur".data(using: .utf8)
    let imageData = "image".data(using: .utf8)
    
//MARK : - Response
    
    let responseOK = HTTPURLResponse(url: URL(string: "http://googl.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)
    
    let responseKO = HTTPURLResponse(url: URL(string: "http://googl.com")!, statusCode: 500, httpVersion: nil, headerFields: nil)
     
//MARK : - Error
    
    class DataError : Error {}
    static let error = DataError()
    
  
    
  
}
