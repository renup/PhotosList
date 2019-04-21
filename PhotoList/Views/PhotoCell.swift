//
//  PhotoCell.swift
//  PhotoList
//
//  Created by Renu Punjabi on 4/20/19.
//  Copyright © 2019 Punjabi, Renu. All rights reserved.
//

import Foundation
import UIKit

final class PhotoCell: UITableViewCell {
    
    var cache: [String: UIImage] = [:]
    
    func configureCell(photo: Photo) {
        guard let url = photo.download_url, let author = photo.author else { return }
        textLabel?.text = author
        if let img = cache[url] {
            imageView?.image = img
        } else {
            
        }
    }
    
}
