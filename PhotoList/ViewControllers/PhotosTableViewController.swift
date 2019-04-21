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
    
    var photosDataSource: [Photo] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier)
        
    }
}

