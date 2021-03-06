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
                //accessoryType = .highlightColor: .rgb(r: 255, g: 240, b: 245)
                detailTextLabel?.text = "Lessons 30+ Check it Out!"
            }else{
                
                detailTextLabel?.text = "Lessons: \(course.numberOfLessons)"
                accessoryType = .none
            }
        }
    }
    
    //MARK: - CONFIGURATION OF AUTO LAYOUT
    
    //Name title customization, collor cell customization.
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        contentView.backgroundColor = isHighlighted ? .highlightColor : .rgb(r: 255, g: 240, b: 245)
        textLabel?.textColor = isHighlighted ? UIColor.white : .mainTextBlue
        detailTextLabel?.textColor = isHighlighted ? .white : .blue
        
    }


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)

        //cell customization
        textLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        textLabel?.numberOfLines = 0
        detailTextLabel?.textColor = .blue
        detailTextLabel?.font = UIFont.systemFont(ofSize: 20, weight: .light)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
       
}
