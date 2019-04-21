//
//  PhotosTableViewController.swift
//  PhotoList
//
//  Created by Punjabi, Renu on 4/20/19.
//  Copyright © 2019 Punjabi, Renu. All rights reserved.
//

import UIKit

final class PhotosTableViewController: UITableViewController {
    
    struct Constants {
        static let cellIdentifier = "photoCell"
    }
    
    var page = 0
    var photosDataSource: [Photo] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getPictures()
    }
    
    private func getPictures() {
        PhotosViewModel.getPhotosList {[unowned self] (photos, error) in
            if error != nil {
                //show alert
            } else {
                guard let pictures = photos else { return }
                self.photosDataSource = pictures
            }
        }
    }
    
}

extension PhotosTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photosDataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier) as! PhotoCell
        cell.configureCell(photo: photosDataSource[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == photosDataSource.count - 1 { // we've reached to the end of the tableview. so we should fetch next set of photos
            page += 1
            PhotosViewModel.getMorePictures(page: page) {[unowned self] (photos, error) in
                if error != nil {
                    //show alert
                } else {
                    guard let pics = photos else { return }
                    self.photosDataSource += pics
                }
            }
            
        }
    }
}

