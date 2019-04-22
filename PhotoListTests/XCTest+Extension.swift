//
//  XCTest+Extension.swift
//  PhotoListTests
//
//  Created by Renu Punjabi on 4/21/19.
//  Copyright © 2019 Punjabi, Renu. All rights reserved.
//

import Mockingjay
import XCTest

extension XCTest {
    public func stub(urlString: String, jsonFileName: String) -> Mockingjay.Stub {
        let path = Bundle(for:  PhotosAPITest.self).path(forResource: jsonFileName, ofType: "json")!
        let data = NSData(contentsOfFile: path)!
        return stub(uri(urlString), jsonData(data as Data))
    }
    
    public func stub(urlString: String, error: NSError) -> Mockingjay.Stub {
        return stub(uri(urlString), failure(error))
    }
}
