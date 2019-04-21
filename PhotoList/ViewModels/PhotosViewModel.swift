//
//  PhotosViewModel.swift
//  PhotoList
//
//  Created by Punjabi, Renu on 4/20/19.
//  Copyright © 2019 Punjabi, Renu. All rights reserved.
//

import Foundation
import UIKit

final class PhotosViewModel {
    
    @discardableResult
    static func getPhotosList(_ completion: @escaping PhotosListResponse) -> URLSessionTask? {
       return PhotosRouter.fetchPhotosList { (photos, error) in
        DispatchQueue.main.async {
            if error != nil {
                completion(nil, error)
            } else {
                guard let picturesArray = photos else {
                    completion(nil, nil)
                    return
                }
                completion(picturesArray, nil)
            }
        }
        
        }
    }
    
    static func getImage(for imageString: String, completion: @escaping ((UIImage?, Error?) -> Void)) -> URLSessionTask? {
        return PhotosRouter.fetchImage(for: imageString){ (image, error) in
            DispatchQueue.main.async {
                if error != nil {
                    completion(nil, error)
                } else {
                    completion(image, nil)
                }
            }
        }
    }
    
}
