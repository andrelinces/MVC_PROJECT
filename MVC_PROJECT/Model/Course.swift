//
//  Course.swift
//  MVC_PROJECT
//
//  Created by Andre Linces on 11/03/22.
//

import Foundation

struct Course: Decodable {
    let id: Int
    let name: String
    let numberOfLessons: Int
}
