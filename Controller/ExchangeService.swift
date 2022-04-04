//
//  HaveChange.swift
//  Baluchon
//
//  Created by Reda on 01/03/2022.
//

import Foundation
class ExchangeService {
    static let shared = ExchangeService()
    var session = URLSession(configuration: .default)
    public init(session:URLSession) {
        self.session = session
    }
     let url = URL(string: "http://data.fixer.io/api/latest?access_key=57b550cde11b259f51e84dbd76457683&symbols=USD")!
    private var task = URLSessionDataTask()
   
    private init() {
        
    }
    
    func getRate (callback : @escaping (Exchange?, Bool)->Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
      
       
        task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let data = data, error == nil {
                    do {
                        let responseJSON = try? JSONDecoder().decode(Exchange.self, from: data)
                        callback(responseJSON, true)
                    }
                     catch  {
                      callback(nil,false)
                    }
                } else {
                    callback(nil,false)
                }
        }
        
        }
        
            task.resume()
    
    
}

 
}
