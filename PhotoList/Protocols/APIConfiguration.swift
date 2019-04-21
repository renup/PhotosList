//
//  APIConfiguration.swift
//  PhotoList
//
//  Created by Punjabi, Renu on 4/20/19.
//  Copyright © 2019 Punjabi, Renu. All rights reserved.
//

import Foundation

protocol APIConfiguration {
    var method: String { get }
    var parameters: [URLQueryItem] { get }
    var path: String { get }
}
