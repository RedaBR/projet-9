//
//  MeteoViewController.swift
//  Baluchon
//
//  Created by Reda on 27/01/2022.
//

import UIKit

class MeteoViewController: UIViewController {
    
    @IBOutlet weak var image1: UIImageView!

    @IBOutlet weak var main: UILabel!
    
    
    @IBOutlet weak var image2: UIImageView!
    
    
    @IBOutlet weak var main2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Baluchon.HaveWeather.shared.weather(city:"Toulon", callback: {(success, meteo,error) in
            self.main.text = meteo?.weather.first?.main
            let iconString = meteo?.weather.first?.icon

            Baluchon.HaveWeather.shared.getImage(iconString: iconString!, completionHandler: { (iconData) in
                if (iconData != nil) {
                    DispatchQueue.main.async{
                        self.image1.image = UIImage.init(data: iconData!)
                    }
                    
                }
            })
        })
        
        HaveWeather.shared.weather(city:"washington", callback: { (succes,meteo,error) in
            self.main2.text = meteo?.weather.first?.main
            let iconString = meteo?.weather.first?.icon

            HaveWeather.shared.getImage(iconString: iconString!, completionHandler: { (iconData) in
                if (iconData != nil) {
                    DispatchQueue.main.async{
                        self.image2.image = UIImage.init(data: iconData!)
                    }
                }
            })
        }
        )
    }
        }

