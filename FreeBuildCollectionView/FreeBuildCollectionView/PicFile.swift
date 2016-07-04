//
//  PicFile.swift
//  FreeBuildCollectionView
//
//  Created by KurtHo on 2016/7/2.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import Foundation
import UIKit


class PictrueList {
    static var pic = [
        PictrueList(name: "1", description: "", content: ""),
        PictrueList(name: "2", description: "", content: ""),
        PictrueList(name: "3", description: "", content: ""),
        PictrueList(name: "4", description: "", content: ""),
        PictrueList(name: "5", description: "", content: ""),
        PictrueList(name: "6", description: "", content: ""),
        PictrueList(name: "7", description: "", content: ""),
        PictrueList(name: "8", description: "", content: ""),
        PictrueList(name: "9", description: "", content: ""),
        PictrueList(name: "10", description: "", content: "")
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