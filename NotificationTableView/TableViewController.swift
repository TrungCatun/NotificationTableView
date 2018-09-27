//
//  TableViewController.swift
//  NotificationTableView
//
//  Created by trung on 2018/08/27.
//  Copyright © 2018 trung. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var array = ["1","e"]

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(setData(notification:)), name: .key, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(array[indexPath.row])
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let toDetail = segue.destination as? DetailViewController {
            if let index = tableView.indexPathForSelectedRow {
                toDetail.dataTake = String(array[index.row])
                toDetail.indexTake = index
            }
        }
    }
    @objc func setData(notification: NSNotification) {
        if let indexpart = tableView.indexPathForSelectedRow {
            array[indexpart.row] = (notification.object as? String)!
            tableView.reloadData()
        }
    }
    
  



}
