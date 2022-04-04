//
//  Convert.swift
//  Baluchon
//
//  Created by Reda on 08/03/2022.
//

import Foundation
class Exchange : Decodable {
    var success : Bool
    var timestamp : Int
    var base : String
    var date : String
    var rates : Rates
}

class Rates : Decodable {
    var USD : Float
}
