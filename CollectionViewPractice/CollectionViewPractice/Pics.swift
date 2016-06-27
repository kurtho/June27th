//
//  Pics.swift
//  CollectionViewPractice
//
//  Created by KurtHo on 2016/6/27.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import Foundation


class PicsList {
    static var pic = [
        PicsList(name: "1"),
        PicsList(name: "2"),
        PicsList(name: "3"),
        PicsList(name: "4"),
        PicsList(name: "5"),
        PicsList(name: "6"),
        PicsList(name: "7"),
        PicsList(name: "8"),
        PicsList(name: "9")
    ]
    var name: String
    init(name: String){
        self.name = name
    }
}