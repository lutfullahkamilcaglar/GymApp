//
//  DataModel.swift
//  My Workout App
//
//  Created by Kamil Caglar on 03/09/2022.
//

import Foundation

struct Category {
    
    let title: String
    let items: [String]
    
    init(title: String, items: [String]){
        self.title = title
        self.items = items
    }
}
