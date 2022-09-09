//
//  WorkoutModel.swift
//  My Workout App
//
//  Created by Kamil Caglar on 08/09/2022.
//

import Foundation


struct WorkoutModel {
    let title: String
    let image: String
    let excercises: [ExcerciseModel]
    
    init(title: String, image: String, excercises: [ExcerciseModel]) {
        self.title = title
        self.image = image
        self.excercises = excercises
    }
}

