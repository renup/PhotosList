//
//  Photos.swift
//  PhotoList
//
//  Created by Punjabi, Renu on 4/20/19.
//  Copyright © 2019 Punjabi, Renu. All rights reserved.
//

import Foundation

struct Photos: Decodable {
    var photos: [Photo]?
}

struct Photo: Decodable {
    var author: String?
    var download_url: String?
}
