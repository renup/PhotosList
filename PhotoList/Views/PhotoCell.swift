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
    var task: URLSessionTask?
    
    func configureCell(photo: Photo) {
        imageView?.image = UIImage(named: "placeholder.png")

        guard let url = photo.download_url, let author = photo.author else { return }
        textLabel?.text = author
        if let img = cache[url] {
            imageView?.image = img
        } else {
            task = PhotosViewModel.getImage(for: url, completion: {[unowned self] (image, error) in
                if let img = image {
                   self.imageView?.image = img
                    self.cache[url] = img
                }
            })
        }
    }
    
    override func prepareForReuse() {
        imageView?.image = nil
        task?.cancel()
        task = nil
    }
    
}
