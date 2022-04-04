//
//  Translate.swift
//  Baluchon
//
//  Created by Reda on 15/03/2022.
//

import Foundation


import Foundation




// MARK: - TranslateData
class TranslateData: Codable {
    let data: DataClass
}

// MARK: - DataClass
class DataClass: Codable {
    let translations: [Translation]
}

// MARK: - Translation
class Translation: Codable {
    let translatedText: String
}

