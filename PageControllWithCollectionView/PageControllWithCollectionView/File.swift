//
//  File.swift
//  PageControllWithCollectionView
//
//  Created by KurtHo on 2016/7/8.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import Foundation
import UIKit

class ProfileImageList {
    static var pic = [
        ProfileImageList(name: "1", description: "description1", content: ""),
        ProfileImageList(name: "2", description: "description2", content: ""),
        ProfileImageList(name: "3", description: "description3", content: ""),
        ProfileImageList(name: "4", description: "description4", content: "")

    ]
    var name: String
    var description: String
    var content: String
    
    init(name: String, description: String, content: String){
        self.name = name
        self.description = description
        self.content = content
    }
}