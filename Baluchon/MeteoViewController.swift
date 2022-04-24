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
    @IBOutlet weak var temp1: UILabel!
    @IBOutlet weak var temp2: UILabel!
    @IBOutlet weak var activityController: UIActivityIndicatorView!
    func loading () {
        activityController.isHidden = false
        main.isHidden = true
        image1.isHidden = true
        temp1.isHidden = true
        main2.isHidden = true
        image2.isHidden = true
        temp2.isHidden = true
    }
    func load () {
        activityController.isHidden = true
        main.isHidden = false
        image1.isHidden = false
        temp1.isHidden = false
        
        main2.isHidden = false
        image2.isHidden = false
        temp2.isHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loading()
        Baluchon.HaveWeather.shared.weather(city:"Toulon", callback: {(success, meteo) in
            self.main.text = meteo?.weather.first?.main
            let iconString = meteo?.weather.first?.icon
            let temperature = meteo?.main.temp
            Baluchon.HaveWeather.shared.getImage(iconString: iconString!, completionHandler: { [self] (iconData) in
                if (iconData != nil) {
                    self.image1.image = UIImage.init(data: iconData!)
                    let ConvertTempInString = String(temperature!)
                    temp1.text = ConvertTempInString
                }
                load()
            })
        })
        HaveWeather.shared.weather(city:"New York Mills", callback: { (succes,meteo) in
            self.main2.text = meteo?.weather.first?.main
            let iconString = meteo?.weather.first?.icon
            let temperature2 = meteo?.main.temp
            HaveWeather.shared.getImage(iconString: iconString!, completionHandler: { (iconData) in
                if (iconData != nil) {
                    self.image2.image = UIImage.init(data: iconData!)
                    let ConvertTempInString2 = String(temperature2!)
                    self.temp2.text = ConvertTempInString2
                }
                self.load()
            })
        }
        )
    }
}

