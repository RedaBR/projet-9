//
//  HaveWeather.swift
//  Baluchon
//
//  Created by Reda on 27/01/2022.
//

import Foundation
class HaveWeather {
    static var shared = HaveWeather()
    var session = URLSession(configuration: .default)
    init(session:URLSession) {
        self.session = session
    }
    // exemple url "https://api.openweathermap.org/data/2.5/weather?q=Toulon&appid=06cd2509ebee347033e212e36769d305"
    
    let baseUrlString = "https://api.openweathermap.org/data/2.5/weather"
    let appId = "06cd2509ebee347033e212e36769d305"
    
    private var task: URLSessionDataTask?
   
    
    private init() { }
    
    func weather (city:String, callback: @escaping (Bool, WheaterData?)->Void) {
        let urlString = baseUrlString + "?q=" + city + "&appid=" + appId
        let url = URL(string: urlString)

        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
      
        task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async{
                if let data = data, error == nil  {
                        do {
                            let weather = try JSONDecoder().decode(WheaterData.self, from:data)
                            callback(true, weather)
                        }
                        catch {
                            print("Task error", error.localizedDescription)
                            callback(false, nil)
                        }
                    
                } else {
                    callback(false,nil)
                }
                

            }
        }
        task?.resume()
    }
    
    func getImage(iconString:String, completionHandler: @escaping ((Data?) -> Void)) {
            let pictureUrl = getWheaterIconUrl(icon: iconString)
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: pictureUrl) { (data, response, error) in
                DispatchQueue.main.async {
                    if let data = data, error == nil {
                        if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                            completionHandler(data)
                        }
                    }
                }
                
            }
            task.resume()
        }
    
    

    func getWheaterIconUrl (icon:String)->URL {
        // http://openweathermap.org/img/wn/10d@2x.png
        
        let baseUrl = "http://openweathermap.org/img/wn/"
        let endUrl = "@2x.png"
        
        let urlString = baseUrl + icon + endUrl
    
        let url = URL(string: urlString)!
        return url
    }
    
}
