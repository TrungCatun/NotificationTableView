//
//  ViewController.swift
//  NotificationTableView
//
//  Created by trung on 2018/08/27.
//  Copyright © 2018 trung. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var dataTake: String?
    var indexTake: IndexPath?
    @IBOutlet weak var outletTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if dataTake != nil {
            outletTextField.text = dataTake
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonDetail(_ sender: Any) {
        NotificationCenter.default.post(name: .key, object: outletTextField.text)
        navigationController?.popViewController(animated: true)
    }
    
}

