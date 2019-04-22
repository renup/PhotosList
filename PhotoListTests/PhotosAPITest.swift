//
//  PhotosAPITest.swift
//  PhotoListTests
//
//  Created by Renu Punjabi on 4/21/19.
//  Copyright © 2019 Punjabi, Renu. All rights reserved.
//

import Quick
import Nimble
import Mockingjay

@testable import PhotoList


class PhotosAPITest: QuickSpec {
    
    override func spec() {
        super.spec()
        
        describe("performRequest") {
            var photoslist: [Photo]?
            var photo: Photo?
            var returnedError: NSError?
            
            context("success") {
                beforeEach {
                    let _ = self.stub(urlString: "https://picsum.photos/v2/list", jsonFileName: "pphotosList")
                    PhotosViewModel.getPhotosList({ (photos, error) in
                        photoslist = photos
                        guard let pics = photos else { return }
                        for pic in pics {
                            if pic.id == 0 {
                                photo = pic
                            }
                        }
                    })
                }
                
                it("returns PhotoListResponse") {
                    expect(photoslist).toEventuallyNot(beNil(), timeout: 20)
                    expect(photoslist?.count).to(equal(30))
                    expect(photo?.author) == "Alejandro Escamilla"
                    expect(photo?.download_url) == "https://picsum.photos/id/0/5616/3744"
                }
            }
            
            context("Error") {
                let err = NSError(domain: "page not found", code: 400, userInfo: nil)
                
                beforeEach {
                    let _ = self.stub(urlString: "https://picsum.photos/v2", error: err)
                    PhotosViewModel.getPhotosList({ (photos, error) in
                        returnedError = error! as NSError
                    })
                }
                it("Fails") {
                    expect(returnedError).toEventuallyNot(beNil())
                    expect(returnedError?.code) == 400
                    expect(returnedError?.domain) == "page not found"
                }
            }
        }
    }
    
}
