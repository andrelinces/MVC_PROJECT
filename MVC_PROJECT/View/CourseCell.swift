//
//  CourseCell.swift
//  MVC_PROJECT
//
//  Created by Andre Linces on 11/03/22.
//

import UIKit

class CourseCell: UITableViewCell {
    //Logic to receive JSON data and display in cells.
    var course: Course! {
        
        didSet {
            
            textLabel?.text = course.name
            
            if course.numberOfLessons > 35 {
                
                accessoryType = .detailDisclosureButton
                detailTextLabel?.text = "Lessons 30+ Check it Out!"
            }else{
                
                detailTextLabel?.text = "Lessons: \(course.numberOfLessons)"
                accessoryType = .none
            }
        }
    }
      
}
