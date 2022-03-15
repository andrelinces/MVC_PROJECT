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
        
        setupNavBar()
        setupTableView()
        fetchData()
        print("test collor")
        
    }
    
    fileprivate func fetchData() {
        Service.shared.fetchCourses { (courses, err) in
            if let err = err {
                print("Failed to fetch courses:", err)
                return
            }
            self.courses = courses ?? []
            self.tableView.reloadData()
            print("test courses \(courses)")
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
    
    //Func for to customization table view
    fileprivate func setupTableView() {
        tableView.register(CourseCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        tableView.separatorColor = .mainTextBlue
        tableView.backgroundColor = UIColor.rgb(r: 12, g: 47, b: 57)
        tableView.backgroundColor = UIColor.purple
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.tableFooterView = UIView()
    }

    fileprivate func setupNavBar() {
        navigationItem.title = "Courses"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .purple
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.rgb(r: 50, g: 199, b: 242)
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.lightGray]
    }
}

class CustomNavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension UIColor {
    static let mainTextBlue = UIColor.rgb(r: 7, g: 71, b: 89)
    static let highlightColor = UIColor.rgb(r: 50, g: 199, b: 242)

    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}

