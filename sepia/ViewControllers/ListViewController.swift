//
//  ListViewController.swift
//  sepia
//
//  Created by Kandula Anand kumar on 30/11/22.
//

import UIKit
import Foundation

class ListViewController: UIViewController {
 
    @IBOutlet weak var listTable: UITableView!
    
     var pets: [Pet] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        getWorkingHours()
        print("current Time: \(Date.getCurrentDate())")
    }
    
    func getWorkingHours() {
        let today = Date()
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.weekday], from: today)
        let startTime = "09:00 AM"
        let endTime = "06:00 PM"
        var isWorkingHour = checkIfCurrentTimeIsBetween(startTime: startTime, endTime: endTime)
        if components.weekday == 1 || components.weekday == 7 {
            DispatchQueue.main.async {
                self.showAlert()
                self.listTable.isHidden = true
            }
            } else {
                if isWorkingHour {
                    DispatchQueue.main.async {
                        self.getData()
                        self.listTable.isHidden = false
                    }
                } else {
                    self.showAlert()
                }
            }
    }
    fileprivate func getData() {
        if let path = Bundle.main.path(forResource: "pets_list ) (1)", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                guard let json = jsonResult as? Dictionary<String, AnyObject>, let dics = json["pets"] else {
                    return
                }
                let array = dics as! [Dictionary<String, AnyObject>]
                for content in array {
                    let title = content["title"] as! String
                    let imgURL = content["image_url"] as! String
                    let contentURL = content["content_url"] as! String
                    let dateAdded = content["date_added"] as! String
                    pets.append(Pet(title: title, dateAdded: dateAdded, image: imgURL, contentUrl: contentURL))
                }
                DispatchQueue.main.async {
                    self.listTable.reloadData()
                }
            } catch {
                print("error")
            }
        }
    }
    func checkIfCurrentTimeIsBetween(startTime: String, endTime: String) -> Bool {
        guard let start = Formatter.today.date(from: startTime),
              let end = Formatter.today.date(from: endTime) else {
            return false
        }
        return DateInterval(start: start, end: end).contains(Date())
    }
    func showAlert() {
        DispatchQueue.main.async {
            var refreshAlert = UIAlertController(title: "Alert", message: "Data is blocked for Weekends", preferredStyle: UIAlertController.Style.alert)
            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
              }))
            present(refreshAlert, animated: true, completion: nil)
        }
    }
 
}
extension ListViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTable.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListTableViewCell
        
        cell.titlelbl.text = pets[indexPath.row].title
        cell.petImg.loadFrom(urlString: pets[indexPath.row].image)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            vc.url = pets[indexPath.row].contentUrl
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
