//
//  CoursesController.swift
//  MVC_PROJECT
//
//  Created by Andre Linces on 13/03/22.
//

import UIKit

class CoursesController: UITableViewController {
    
    var courses = [Course]()
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    fileprivate func fetchData() {
        Service.shared.fetchCourses { (courses, err) in
            if let err = err {
                print("Failed to fetch courses:", err)
                return
            }
            
            self.courses = courses ?? []
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CourseCell
        let courses = courses[indexPath.row]
        cell.course = courses
        return cell
    }
    
    
    
}
