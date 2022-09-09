//
//  DateModel.swift
//  My Workout App
//
//  Created by Kamil Caglar on 31/08/2022.
//

import Foundation

func showDate() {
    let dateFormater = DateFormatter()
    dateFormater.dateFormat = "dd MMM, yyyy - hh:mm:ss"
    let theDate = dateFormater.string(from: Date())
    print(theDate)
}
