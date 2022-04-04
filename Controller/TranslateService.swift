//
//  TranslateService.swift
//  Baluchon
//
//  Created by Reda on 15/03/2022.
//

import Foundation
class TranslateService {
    var session = URLSession(configuration: .default)
    var task = URLSessionTask()
    init(session:URLSession) {
        self.session = session
    }
    //url = "https://translation.googleapis.com/language/translate/v2?key=AIzaSyCV6W0tPgrYrJ0G7o7xjoFtkks2ir-ZFHs&q=The"
    
    let baseUrl = "https://translation.googleapis.com/language/translate/v2"
    let apiKey = "AIzaSyCV6W0tPgrYrJ0G7o7xjoFtkks2ir-ZFHs"
    let endUrl = "&source=fr&target=en&format=text"
    
    func getTranslate(text : String?, callback: @escaping(TranslateData?,Bool)->Void) {
        let url = getUrl(text: text ?? "Veuillez inserer")
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        task = session.dataTask(with: request) { (data, Response, error) in
            DispatchQueue.main.async {
                if let data = data , error == nil {
                    do {
                        let responseJSON = try JSONDecoder().decode(TranslateData.self, from: data)
                        callback(responseJSON, true)
                    }
                    catch {
                        callback(nil,false)
                    }
                } else {
                    callback(nil,false)
                }
            }
            
        }
        task.resume()
    }
    
    func getUrl(text:String)->URL {

        let originalString = baseUrl + "?key=" + apiKey + "&q=" + text + endUrl
        let urlString = originalString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlString!)
        return url!
        
    }
    
    
}

