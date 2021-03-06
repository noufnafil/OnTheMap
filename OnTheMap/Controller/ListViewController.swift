//
//  ListViewController.swift
//  OnTheMap
//
//  Created by nouf alharbi on 2/13/19.
//  Copyright © 2019 nouf alharbi. All rights reserved.
//



import Foundation
import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.fetchLocations()
        }
    }
    
    func fetchLocations() {
        ParseClient.sharedInstance().displayStudentLocations { (locations, success, error) in
            if success {
                
                DispatchQueue.main.async {
                    self.listTableView.reloadData()
                }
            }
        }
    }
    
    // MARK: Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StudentLocation.studentLocations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let student = StudentLocation.studentLocations[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentsCell")!
        
        let letters = NSCharacterSet.letters
        let fullName = "\(String(describing: student.firstName)) \(String(describing: student.lastName))"
        let range = fullName.rangeOfCharacter(from: letters)
        
        if (range != nil) {
            if (student.firstName != nil && student.lastName != nil) {
                cell.textLabel?.text = "\(student.firstName!) \(student.lastName!)"}
            else{
                cell.textLabel?.text = ConstantsParse.NoName
            }
        }
            
        else {
            cell.textLabel?.text = ConstantsParse.NoName
        }
        
        if let mediaUrl = student.mediaURL {
            cell.detailTextLabel?.text = mediaUrl
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let app = UIApplication.shared
        let mediaUrl = StudentLocation.studentLocations[indexPath.row].mediaURL
        if let toOpen = mediaUrl {
            if canVerifyUrl(urlString: toOpen) {
                app.open(URL(string: toOpen)!, options: [:], completionHandler: nil)
            } else {
                showAlert("The URL was invalid")
            }
        }
    }
    
    //Method to show alerts
    func showAlert(_ error: String) {
        let alert = UIAlertController(title: "Error!", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //Method to verify url
    func canVerifyUrl (urlString: String?) -> Bool {
        if let urlString = urlString {
            if let url  = NSURL(string: urlString) {
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }
    @IBAction func logoutAction(_ sender: Any) {
        UdacityClient.sharedInstance().endUserSession { (success, error) in
            if success {
                self.tabBarController?.dismiss(animated: true, completion: nil)
            } else {
                self.showAlert(error!)
            }
            
            
        }
        
    }
}
